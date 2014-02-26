class IssuesChangeDateToDatetime < ActiveRecord::Migration
  def change
    change_column :issues, :date, :datetime
  end
end
