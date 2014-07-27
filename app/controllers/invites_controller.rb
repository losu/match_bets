#coding: UTF-8

class InvitesController < ApplicationController
  
  def create
		@invite=Invite.new(invite_params)
		@from = current_user.email
		@email = params[:invite][:email]
		@id = params[:invite][:group_id]
		UserMailer.welcome_email(@email, @id, @from).deliver
		@invite.email = @email
		@invite.group_id = @id
		@invite.save
		redirect_to group_path(@id)
	end

	private 
	def invite_params
		params.require(:invite).permit(:email, :group_id)
	end


end