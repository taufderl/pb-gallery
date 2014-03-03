class SelfHostedGallery < Gallery
  has_many :images, foreign_key: :gallery_id

end
