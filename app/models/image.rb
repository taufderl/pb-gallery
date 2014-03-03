class Image < ActiveRecord::Base
  belongs_to :gallery
  
  has_attached_file :file, :styles => { :full => "2048x2048>", :thumb => "200x200>" }
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  
  def name
    self.file_file_name
  end
  
  def jquery_upload_result
    {files: [{
      "name" => self.file_file_name,
      "size" => self.file_file_size,
      "thumbnail_url" => file.url(:thumb),
      "full_url" => file.url(:full),
      "delete_url" => Rails.application.routes.url_helpers.gallery_image_path(self.gallery, self),
      "delete_type" => "DELETE" 
    }]}
  end
end
