class Role < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :user
  
  def translated_name
    return I18n.t("role.#{name}")
  end
end
