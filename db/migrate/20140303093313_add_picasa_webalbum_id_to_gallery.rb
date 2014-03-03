class AddPicasaWebalbumIdToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :picasa_webalbum_id, :integer
  end
end
