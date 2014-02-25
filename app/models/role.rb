class Role < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  def translated_name
    return I18n.t("role.#{name}")
  end
end
