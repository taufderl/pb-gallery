module UsersHelper

  def user_row_class(user)
    if user.admin?
      'info'
    elsif not user.approved?
      'danger'
    end 
  end
end
