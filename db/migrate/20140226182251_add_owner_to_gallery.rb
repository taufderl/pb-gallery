class AddOwnerToGallery < ActiveRecord::Migration
  def change
    add_reference :galleries, :owner, index: true
  end
end
