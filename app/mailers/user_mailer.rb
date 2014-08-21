class UserMailer < ActionMailer::Base
  default from: "from@example.com"

    def new_user(invite, invite_token)
        @recipient_email = invite.email
        @sender_email = User.find_by_id(invite.sender_id).email
        @sender_nickname = User.find_by_id(invite.sender_id).nickname
        @url = root_url.chop+invite_token
        @group_name = Group.find_by_id(invite.group_id).name
        mail(to: @recipient_email, subject: 'Welcome to My Awesome Site')
    end
    def existing_user(invite, invite_token)
        @recipient_email = invite.email
        @sender_email = User.find_by_id(invite.sender_id).email
        @recipient_nickname = User.find_by_id(invite.recipient_id).nickname
        @sender_nickname = User.find_by_id(invite.sender_id).nickname
        @url = root_url.chop+invite_token
        @group_name = Group.find_by_id(invite.group_id).name
        mail(to: @recipient_email, subject: 'Welcome to My Awesome Site')
    end


end
