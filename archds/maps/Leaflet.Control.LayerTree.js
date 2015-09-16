/*
 Toggle layers arranged in a tree, rather than just a list of layers.
 Built for the http://archaeologydataservice.ac.uk based upon L.Control.Layers
 */
L.Control.LayerTree = L.Control.extend({
  options: {
    collapsed: true,
    position: 'topright',
    autoZIndex: true,
    hideTopmostNode: true // @TODO: Want to hide the 'Map' top (group) node
  },

  initialize: function (layerTree, options) {
    L.setOptions(this, options)

    this._layerTree = layerTree
    this._lastZIndex = 0
    this._handlingClick = false
  },

  onAdd: function () {
    this._initLayout()
    this.render()

    return this._container
  },

  _initLayout: function () {
    var className = 'leaflet-control-layertree',
        container = this._container = L.DomUtil.create('div', className);

    // makes this work on IE touch devices by stopping it from firing a mouseout event when the touch is released
    container.setAttribute('aria-haspopup', true);

    if (!L.Browser.touch) {
      L.DomEvent
        .disableClickPropagation(container)
        .disableScrollPropagation(container);
    } else {
      L.DomEvent.on(container, 'click', L.DomEvent.stopPropagation);
    }

    var form = this._form = L.DomUtil.create('form', className + '-list');

    if (this.options.collapsed) {
      if (!L.Browser.android) {
        L.DomEvent.on(container, {
          mouseenter: this._expand,
          mouseleave: this._collapse
        }, this);
      }

      var link = this._layersLink = L.DomUtil.create('a', className + '-toggle', container);
      link.href = '#';
      link.title = 'Layers';

      if (L.Browser.touch) {
        L.DomEvent
            .on(link, 'click', L.DomEvent.stop)
            .on(link, 'click', this._expand, this);
      } else {
        L.DomEvent.on(link, 'focus', this._expand, this);
      }

      // work around for Firefox Android issue https://github.com/Leaflet/Leaflet/issues/2033
      L.DomEvent.on(form, 'click', function () {
        setTimeout(L.bind(this._onInputClick, this), 0);
      }, this);

      this._map.on('click', this._collapse, this);
      // TODO keyboard accessibility
    } else {
      this._expand();
    }

    this._domTree = L.DomUtil.create('div', className + '-tree', form)

    container.appendChild(form)
  },

  // Unlike with the original L.Control.Layers._update, render is public.
  // This is so changes to the underlying Tree can be manually updated, keeping
  // things simple.
  render: function () {
    if (!this._container) { return this; }

    this._domTree.innerHTML = ''
    this._inputNodeIdMap = {}

    // Recursively render the tree.
    var treeDomTree = this._renderNode(this._layerTree)
    this._domTree.appendChild(treeDomTree)

    return this;
  },

  _renderNode: function (node) {
    // DOM structure: label > holder > [input?, name, children_ol]
    // @TODO: Need to carefully avoid putting descendants inside a <label>.
    //        Suggest using the <li> inside _renderNode as:
    //        li >
    //          label >
    //            holder >
    //             input?
    //             name
    //          ol
    //            li > ...

    var item = document.createElement('li'),
        label = document.createElement('label'),
        holder = document.createElement('div')

    item.appendChild(label)
    label.appendChild(holder)

    // Checkbox
    if (node.options.controllable) {
      var input = document.createElement('input')
      input.type = 'checkbox'
      input.className = 'leaflet-control-layertree-selector'
      // @TODO: How to handle 'partially visible' groupnodes?
      input.defaultChecked = node.visible(this._map)
      // Save a unique ID on the input so I can filter the Tree and get back
      // this node upon DOM event.
      input.nodeId = L.stamp(node)
      this._inputNodeIdMap[input.nodeId] = node
      holder.appendChild(input)

      L.DomEvent.on(input, 'click', this._onInputClick, this)
    }

    var name = document.createElement('span')
    name.innerHTML = ' ' + node.name
    holder.appendChild(name)

    // Children
    // @TODO: Would be nice if node.canHaveChildren also toggled a class, for styling.
    if (node.canHaveChildren && !node.options.collapsed) {
      var descendants = document.createElement('ol')
      item.appendChild(descendants)

      for (var i in node.children) {
        var descendant = this._renderNode(node.children[i])
        descendants.appendChild(descendant)
      }
    }

    return item
  },

  _onInputClick: function () {
    console.log("_onInputClick")
    // Because of the https://github.com/Leaflet/Leaflet/issues/2033 fix, we have
    // to iterate over all input fields rather than just toggling the one that was
    // acted upon.

    var inputs = this._form.getElementsByTagName('input'),
        toDisable = [],
        toEnable = []

    // The fix for https://github.com/Leaflet/Leaflet/issues/2318 applies less, as
    // this control doesn't expose the problematic event. However for futureproofing
    // I've kept the fix convention of disabling before enabling.

    for (var i = inputs.length - 1; i >= 0; i--) {
      var input = inputs[i]
      // Find the layertree node this checkbox refers to.
      var node = this._inputNodeIdMap[input.nodeId]

      if (!input.checked && node.visible(this._map)) {
        console.log("!input.checked && node.visible", node.name)
        toDisable.push(node)
      }
      if (input.checked && !node.visible(this._map)) {
        console.log("input.checked && !node.visible", node.name)
        toEnable.push(node)
      }
    }

    for (var i in toDisable) {
      toDisable[i].disable(this._map)
    }
    for (var i in toEnable) {
      toEnable[i].enable(this._map)
    }

    this.render()
    this._refocusOnMap()
  },

  _expand: function () {
    L.DomUtil.addClass(this._container, 'leaflet-control-layertree-expanded');
    var acceptableHeight = this._map._size.y - (this._container.offsetTop * 4);
    if (acceptableHeight < this._form.clientHeight) {
      L.DomUtil.addClass(this._form, 'leaflet-control-layertree-scrollbar');
      this._form.style.height = acceptableHeight + 'px';
    }
  },

  _collapse: function () {
    L.DomUtil.removeClass(this._container, 'leaflet-control-layertree-expanded');
  }
});

L.control.layerTree = function (baseLayers, overlays, options) {
  return new L.Control.LayerTree(baseLayers, overlays, options);
};

// LayerTree GroupNode and LayerNode options
//
// controllable: render a checkbox alongside this node in the control,
//               so that this particular node can be toggled. note that for group
//               nodes this involves toggling all the descendant layer nodes.
//               note that the name of the node will be rendered regardless, this
//               just controls whether a checkbox accompanies it.
// collapsed: don't list any children of this node when rendering the control,
//            such that the children lack controls and are completely dependent
//            upon the control of this node. overrides controllable on children.

L.Control.LayerTree.GroupNode = L.Class.extend({
  options: {
    collapsed: false,
    controllable: true
  },

  canHaveChildren: true,

  initialize: function (name, options) {
    L.setOptions(this, options)
    this.name = name
    this.children = []
  },

  visible: function (map) {
    var visible = true
    for (var i in this.children) {
      visible &= this.children[i].visible(map)
    }
    return visible
  },

  enable: function (map) {
    console.log("Enable group " + this.name)
    for (var i in this.children) {
      this.children[i].enable(map)
    }
  },

  disable: function (map) {
    console.log("Disable group " + this.name)
    for (var i in this.children) {
      this.children[i].disable(map)
    }
  },

  pushChild: function (childNode) {
    this.children.push(childNode)
  },

  find: function (filterFunction) {
    if (filterFunction(this)) {
      return this
    }
    for (var i in this.children) {
      if (this.children[i].find(filterFunction)) {
        return this.children[i]
      }
    }
    return false
  }
})

L.Control.LayerTree.LayerNode = L.Class.extend({
  options: {
    controllable: true
  },

  canHaveChildren: false,

  initialize: function (layer, name, options) {
    L.setOptions(this, options)
    this.layer = layer
    this.name = name
  },

  visible: function (map) {
    return map.hasLayer(this.layer)
  },

  enable: function (map) {
    console.log("Enable layer " + this.name)
    map.addLayer(this.layer)
  },

  disable: function (map) {
    console.log("Disable layer " + this.name)
    map.removeLayer(this.layer)
  },

  find: function (filterFunction) {
    return filterFunction(this) ? this : false
  }
})
