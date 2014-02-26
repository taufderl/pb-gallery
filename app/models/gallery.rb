class Gallery < ActiveRecord::Base
  has_many :images
  has_and_belongs_to_many :permitted_users, class_name: User, join_table: :gallery_permissions
  belongs_to :owner, class_name: User
end
