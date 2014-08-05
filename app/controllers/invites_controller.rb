# coding: UTF-8

class InvitesController < ApplicationController
  
  def create

		@invite=Invite.new(invite_params)
		@invite.sender_id = current_user.id
		@id = params[:invite][:group_id]

		@invite.save
		if @invite.recipient == nil
			UserMailer.new_user(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
			redirect_to group_path(@id)
		else
			UserMailer.existing_user(@invite, groups_path(:invite_token => @invite.token)).deliver
			redirect_to group_path(@id)
		end
	end

	private 
	
	def invite_params
		params.require(:invite).permit(:email, :group_id)
	end

end
