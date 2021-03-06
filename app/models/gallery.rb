class Gallery < ActiveRecord::Base
  has_and_belongs_to_many :permitted_users, class_name: User, join_table: :gallery_permissions
  belongs_to :owner, class_name: User
  validates_uniqueness_of :key
  validates_presence_of :name, :date
  
  TYPES =
    [ [I18n.t('gallery.self_hosted'), 'SelfHostedGallery'], [I18n.t('gallery.picasa'), 'PicasaGallery'] ]
  
  
  def permitted_for?(user)
    permitted_users.include? user
  end
end
