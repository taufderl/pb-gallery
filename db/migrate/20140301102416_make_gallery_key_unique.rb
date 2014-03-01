class MakeGalleryKeyUnique < ActiveRecord::Migration
  def change
    add_index :galleries, :key, :unique => true
  end
end
