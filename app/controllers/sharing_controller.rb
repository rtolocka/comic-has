class SharingController < ApplicationController
    
    def index
        render 'share'
    end
    
    # this gives me the willies, but whatever. fix later.
    def create
        #User.transaction.do
           email = params[:email]
           logger.debug(email)
           generated_password = Devise.friendly_token.first(8)
           begin
              user = User.create!(:email => email, :password => generated_password)
              UserMailer.send_welcome_email(self).deliver
              flash[:notice] = "Invitation sent."        
           rescue
              flash[:error] = "FUCK."
           end
           render 'results'
        #end
    end
end