#coding: UTF-8

class InvitesController < ApplicationController
  
  def create
		@invite=Invite.new(invite_params)
		@invite.sender_id = current_user.id
		@id = params[:invite][:group_id]

		# UserMailer.welcome_email(@invite).deliver
		# UserMailer.welcome_email(@invite, new_user_registration_path(:invite_token => @invite.token))

		@invite.save
		UserMailer.welcome_email(@invite, new_user_registration_path(:invite_token => self.token).deliver
		redirect_to group_path(@id)
	end

	private 
	def invite_params
		params.require(:invite).permit(:email, :group_id)
	end


end