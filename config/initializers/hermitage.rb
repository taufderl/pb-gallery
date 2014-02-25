# Configuration file for hermitage gem

# Default config is used as base options hash for every gallery.
# You can configure any of its options and they will be applied for every rendering.
#
Hermitage.configure :default do
  original -> item { item.file.url(:full) }
  thumbnail -> item { item.file.url(:thumb) }
  title nil
  list_tag :div
  item_tag :p
  list_class 'thumbnails'
  item_class 'col-md-3'
  link_class 'thumbnail'
  image_class nil
  each_slice nil
end

# Also you can create your own configs that will be merged with default config to overwrite default options.
#
# E.g. when you write
#
#   render_gallery_for @images
#
# :images config will be used.
#
# All available options are listed in default config above.
#
# Hermitage.configure :images do
#
# end