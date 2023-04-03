# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: User.first).welcome_email
  end
  
  def album_creation_email
        UserMailer.with(user: User.first, album: ImageAlbum.first).album_creation_email
      end
end
