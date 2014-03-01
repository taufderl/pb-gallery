class Image < ActiveRecord::Base
  belongs_to :gallery
  
  has_attached_file :file, :styles => { :full => "1024x1024>", :thumb => "200x200>" }
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  
  def name
    self.file_file_name
  end
  
  
  def to_jq_upload
    {
      "name" => read_attribute(:file_file_name),
      "size" => read_attribute(:file_file_size),
      "thumbnail_url" => file.url(:thumb),
      "delete_url" => Rails.application.routes.url_helpers.image_path(self),
      "delete_type" => "DELETE" 
    }
  end
end
