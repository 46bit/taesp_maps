# ArchDS Maps

## Building Clojure Library `goog.require` dependency lists
```
cd closure-library/closure/bin
python build/depswriter.py \
  ../../../ol3-3.8.2/ol/**/*.js \
  ../../../ol3-3.8.2/ol.ext/*.js \
  > ../../../ol3-3.8.2/ol3-3.8.2-deps.js
python build/depswriter.py \
  ../../../archds/**/*.js \
  > ../../../archds/archds-deps.js
```
