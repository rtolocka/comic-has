class UserMailer < ActionMailer::Base
  default from: "comic-has@richtolocka.com"
  
  def send_welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'View My Comics', body: 'Your password is #{@user.generated_password}')
  end

end
