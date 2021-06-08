class UsersMailer < ApplicationMailer
  default from: 'admin@kpihunters.com'
  layout 'mailer'

  def destroy_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Aviso de exclusão de conta')
  end
end
