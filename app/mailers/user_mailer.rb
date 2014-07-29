class UserMailer < ActionMailer::Base
  default from: "from@example.com"

    def new_user(invite, invite_token)
        @email = invite.email
        @from = User.find_by_id(invite.sender_id).email
        @localhost = 'http://localhost:3000'
        @url = @localhost+invite_token
        @id = invite.group_id
        @group_name = Group.find_by_id(@id).name
        mail(to: @email, subject: 'Welcome to My Awesome Site')
    end

    def existing_user(invite, invite_token)
        @email = invite.email
        @from = User.find_by_id(invite.sender_id).email
        @localhost = 'http://localhost:3000'
        @url = @localhost+invite_token
        @id = invite.group_id
        @group_name = Group.find_by_id(@id).name
        mail(to: @email, subject: 'Welcome to My Awesome Site')
    end


end