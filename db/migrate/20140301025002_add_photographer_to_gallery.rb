class AddPhotographerToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :photographer, :string
  end
end
