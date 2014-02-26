module UsersHelper

  def user_row_class(user)
    if user.admin?
      'info'
    elsif user.approved?
      'success'
    end 
  end
end
