class ChangePicasaGalleryIdToString < ActiveRecord::Migration
  def change
    change_column :galleries, :picasa_webalbum_id, :string
  end
end
