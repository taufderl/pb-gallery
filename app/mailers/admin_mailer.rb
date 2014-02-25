class AdminMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']
  default to: ENV['ADMIN_MAIL']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_user_wariting_for_approval.subject
  #
  def new_user_waiting_for_approval(user)
    @user = user
    
    mail
  end
end
