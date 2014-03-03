class SelfHostedGallery < Gallery
  has_many :images, foreign_key: :gallery_id

  def number_of_images
    images.count
  end
end
