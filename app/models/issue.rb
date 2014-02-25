class Issue < ActiveRecord::Base
  belongs_to :user
  
  def solved?
    self.status == 'solved'
  end
end
