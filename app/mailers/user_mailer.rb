class UserMailer < ApplicationMailer
    default from: 'prerna.lubana02@gmail.com'
    def welcome_email
        @user = params[:user]
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to My ImageGallery')
      end

      def album_creation_email
        @user = params[:user]
       
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'New Album Created')
      end
end
