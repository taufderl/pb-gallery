class AddDateToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :date, :date
  end
end
