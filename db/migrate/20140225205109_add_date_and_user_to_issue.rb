class AddDateAndUserToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :date, :date
    add_reference :issues, :user, index: true
  end
end
