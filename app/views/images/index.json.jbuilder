json.array!(@images) do |image|
  json.name image.name
  json.size image.file_file_size
  json.thumbnail_url image.file.url(:thumb)
  json.delete_url gallery_image_path(@gallery, image)
  json.delete_type "DELETE" 
end
