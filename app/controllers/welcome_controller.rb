class WelcomeController < ApplicationController
  # no need for authentication for the start page -> index action
  skip_before_filter :authenticate_user!, only: :index
  
  # startpage
  def index
    if user_signed_in?
      if admin?
        render action: :dashboard
      else
        redirect_to galleries_path
      end
    else
      # notthing, render normal index page
    end
  end
  
  # dashboard which is the start page for an administrator
  def dashboard
  end
  
  # galleries view for the registered users 
  def galleries
    
  end
end
