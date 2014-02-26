class CreateGalleryPermissions < ActiveRecord::Migration
  def change
    create_table :gallery_permissions do |t|
      t.references :user, index: true
      t.references :gallery, index: true

      t.timestamps
    end
  end
end
