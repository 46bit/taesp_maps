goog.provide('archds.maps.control.TocContents');

goog.require('goog.asserts');
goog.require('goog.dom');
goog.require('goog.dom.TagName');
goog.require('goog.dom.classlist');
goog.require('goog.events');
goog.require('goog.events.EventType');
goog.require('ol.control.Control');

archds.maps.control.TocContents = function(opt_options) {
  var options = goog.isDef(opt_options) ? opt_options : {};

  this.toc_ = options.toc

  this.cssClassName_ = goog.isDef(options.className) ?
      options.className : 'adscontrols-toccontents';

  var list = goog.dom.createDom(goog.dom.TagName.OL)
  var element = goog.dom.createDom(goog.dom.TagName.DIV, {
    "class": this.cssClassName_
  }, list)

  goog.base(this, {
    element: element,
    target: options.target
  });

  if (this.toc_.name == "All Layers") {
    if (this.toc_ && this.toc_.layersAndGroups && this.toc_.layersAndGroups.length > 0) {
      for (var i in this.toc_.layersAndGroups) {
        var layerOrGroup = this.toc_.layersAndGroups[i]
        this.renderContents_(list, layerOrGroup, true)
      }
    }
  } else {
    this.renderContents_(list, this.toc_, true)
  }
};
goog.inherits(archds.maps.control.TocContents, ol.control.Control);

archds.maps.control.TocContents.prototype.renderContents_ = function (parent, toc_node, render) {
  if (toc_node.name == "Info") {
    return
  }

  if (render) {
    var checkbox_element = goog.dom.createDom(goog.dom.TagName.INPUT, {
      type: "checkbox",
      checked: toc_node.visible ? "checked" : ""
    })
    var name_element = goog.dom.createDom(goog.dom.TagName.SPAN)
    name_element.innerHTML = toc_node.name

    var toc_node_element = goog.dom.createDom(goog.dom.TagName.LI, {},
      goog.dom.createDom(goog.dom.TagName.LABEL, {}, [checkbox_element, name_element]))
    parent.appendChild(toc_node_element)
  }

  if (toc_node.layersAndGroups && toc_node.layersAndGroups.length > 0) {
    var all_checked = true
    var toc_node_list = goog.dom.createDom(goog.dom.TagName.OL)
    toc_node_element.appendChild(toc_node_list)
    for (var i in toc_node.layersAndGroups) {
      var layerOrGroup = toc_node.layersAndGroups[i]
      all_checked &= this.renderContents_(toc_node_list, layerOrGroup, render && (toc_node.b != false))
    }
    if (all_checked) {
      checkbox_element.checked = "checked"
    }
  }

  return !!toc_node.visible
}

archds.maps.Contents = function (namespace) {
  this.layers = []
  this.tree = []
}

archds.maps.Contents.fromToc = function (toc) {

}

archds.maps.Contents.prototype.olLayers = function () {

}

archds.maps.Contents.Group = function (name, visible, collapsed, layers) {
  this.name = name
  this.visible = visible
  this.collapsed = collapsed
  this.layers = layers ? layers : []
  this.rendered = false
}

archds.maps.Contents.Group.prototype.render = function (parent) {
  if (!this.visible) {
    return
  }
  this.checkbox =
  this.
  this.rendered = true
}

archds.maps.Contents.Group.prototype.enable = function () {
  for (var i = 0; i < this.layers.length; i++) {
    this.layers[i].enable(true)
  }
}

archds.maps.Contents.Group.prototype.disable = function () {
  for (var i = 0; i < this.layers.length; i++) {
    this.layers[i].disable(true)
  }
}

archds.maps.Contents.Group.prototype.isFullyEnabled = function () {
  var enabled = true
  for (var i = 0; i < this.layers.length; i++) {
    enabled &= this.layers[i].enabled
  }
  return enabled
}

archds.maps.Contents.Group.prototype.updateFullyEnabled = function () {
  this.enabled = this.isFullyEnabled()
  if (this.rendered) {
    this.checkbox.setAttribute("checked", this.enabled ? "checked" : "")
  }
}

archds.maps.Contents.Layer = function (name, parent, enabled) {
  this.name = name
  this.parent = parent
  this.enabled = enabled
}

archds.maps.Contents.Layer.prototype.render = function (parent) {
  if (!this.visible) {
    return
  }
  this.rendered = true
}

archds.maps.Contents.Layer.prototype.enable = function (skip_parent) {
  this.enabled = true
  this.updateEnabled(skip_parent)
}

archds.maps.Contents.Layer.prototype.disable = function (skip_parent) {
  this.enabled = false
  this.updateEnabled(skip_parent)
}

archds.maps.Contents.Group.prototype.updateEnabled = function (skip_parent) {
  if (this.rendered) {
    this.checkbox.setAttribute("checked", this.enabled ? "checked" : "")
  }
  if (!skip_parent) {
    this.parent.updateFullyEnabled()
  }
}

// --------------------------------------------------------------

archds.maps.contents.Contents = function (tree) {
  this.tree = tree
  this.layers = this.getLayers(tree)
}

archds.maps.contents.Contents.prototype.getLayers = function (tree) {
  layers = []
  for (var i = 0; i < tree.length; i++) {
    if (tree[i] instanceof archds.maps.contents.Group) {
      layers += this.getLayers(tree[i].children)
    } else if (tree[i] instanceof archds.maps.contents.Layer) {
      layers.push(tree[i])
    }
  }
  return layers
}

archds.maps.contents.Contents.prototype.isVisible = function () {
  return true
}

archds.maps.contents.Group = function (parent, children, name, collapsed) {
  this.parent = parent
  this.children = children
  this.name = name
  this.collapsed = collapsed
}

archds.maps.contents.Group.prototype.isEnabled = function () {
  enabled = true
  for (var i = 0; i < this.children.length; i++) {
    if (this.children[i] instanceof archds.maps.contents.Group) {
      enabled &= this.children[i].isEnabled()
    } else if (this.children[i] instanceof archds.maps.contents.Layer) {
      enabled &= this.children[i].enabled
    }
  }
  return enabled
}

archds.maps.contents.Group.prototype.isVisible = function () {
  return !this.parent.collapsed && this.parent.isVisible()
}

archds.maps.contents.Layer = function (parent, name, enabled) {
  this.parent = parent
  this.name = name
  this.enabled = enabled
}

archds.maps.contents.Layer.prototype.isVisible = function () {
  return !this.parent.collapsed && this.parent.isVisible()
}

// --------------------------------------------------------------

archds.maps.contents.Contents.Renderer = function (contents, element) {
  this.contents = contents
  this.element = element

  for (var i = 0; i < this.contents.tree.length; i++) {
    if (this.contents.tree[i] instanceof archds.maps.contents.Group) {

      enabled &= this.children[i].isEnabled()
    } else if (this.contents.tree[i] instanceof archds.maps.contents.Layer) {
      enabled &= this.children[i].enabled
    }
  }
}

archds.maps.contents.Group.Renderer = function (group) {

}

archds.maps.contents.Layer.Renderer = function (layer) {

}
