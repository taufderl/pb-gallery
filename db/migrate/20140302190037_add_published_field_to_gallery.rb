class AddPublishedFieldToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :published, :boolean
  end
end
