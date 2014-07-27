class UserMailer < ActionMailer::Base
  default from: "from@example.com"

    def welcome_email(email, id, from)
        @email = email
        @id = id
        @from = from
        @url = 'http://example.com/login'
        mail(to: @email, subject: 'Welcome to My Awesome Site')
    end
end