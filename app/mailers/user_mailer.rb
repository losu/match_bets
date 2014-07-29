class UserMailer < ActionMailer::Base
  default from: "from@example.com"

    def welcome_email(invite, invite_token)
        @email = invite.email
        @from = User.find_by_id(invite.sender_id).email
        @url = invite_token
        @id = invite.group_id
        mail(to: @email, subject: 'Welcome to My Awesome Site')
    end
end