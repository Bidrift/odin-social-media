class UserMailer < ApplicationMailer
    def welcome_email
        @user = params[:user]
        @url = root_url
        mail(to: @user.email, subject: "Welcome to Sodin")
    end
end
