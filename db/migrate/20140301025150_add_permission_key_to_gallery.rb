class AddPermissionKeyToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :key, :string
  end
end
