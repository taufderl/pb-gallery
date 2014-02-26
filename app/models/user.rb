class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :roles
  has_and_belongs_to_many :permitted_galleries, class_name: Gallery, join_table: :gallery_permissions
  has_many :galleries, foreign_key: :owner_id
  
  after_initialize :init_role
  def init_role
    self.role ||= Role.find_by(name: :watcher)
  end
  
  validates :first_name, presence: true
  validates :name, presence: true
  
  after_create :send_waiting_for_approval_mail
  def send_waiting_for_approval_mail
    #TODO: activate and test!!
    #AdminMailer.new_user_waiting_for_approval(self).deliver
  end
  
  def full_name
    "#{self.first_name} #{self.name}"
  end
  def to_s
    "#{self.full_name} <#{self.email}>"
  end
  
  def admin?
    return self.role? 'admin'
  end
  
  def role?(role)
    if self.role
      self.role.name.to_s.downcase == role
    else
      false
    end
  end
  
  # override for approval functionality
  def active_for_authentication? 
    super && approved? 
  end 

  # override for approval functionality
  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end
