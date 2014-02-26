class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :roles
  after_initialize :init_role
  def init_role
    self.role ||= Role.find_by(name: :watcher)
  end
  
  validates :first_name, presence: true
  validates :name, presence: true
  
  after_create :send_waiting_for_approval_mail
  def send_waiting_for_approval_mail
    AdminMailer.new_user_waiting_for_approval(self).deliver
  end
  
  def role?(role)
    if self.role
      self.role.name.to_s.downcase == role
    else
      false
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
