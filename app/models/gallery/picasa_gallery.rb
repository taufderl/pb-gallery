class PicasaGallery < Gallery
  
  
  def images
    repository = PicasaWebAlbums.get_repository(ENV['PICASA_GOOGLE_USER'], ENV['PICASA_GOOGLE_PASSWORD'])
    picasa_images = repository.get_photos_by_album_id(self.picasa_webalbum_id)
  end
  
  def number_of_images
    return 0
  end

end
