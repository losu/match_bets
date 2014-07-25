#coding: UTF-8

class InvitesController < ApplicationController
  
  def create
		@invite=Invite.new(invite_params)
		@email = params[:invite][:email]
		@id = params[:invite][:group_id]
		UserMailer.welcome_email(@email, @id).deliver
		@invite.email = @email
		@invite.group_id = @id
		@invite.save
		redirect_to groups_path
	end

	private 
	def invite_params
		params.require(:invite).permit(:email, :group_id)
	end


end