#coding: UTF-8

class GroupsController < ApplicationController
		before_action :authenticate_user! #, only: [ :new, :create]
		helper_method :sendmail

	def index
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])
		@invite = Invite.new
		@id = params[:id]
		@matches = Match.where('deadline <= :time', :time=>Time.now - 100)
	end

	def sendmail(id, user)
		UserMailer.welcome_email(@user, @id).deliver
		redirect_to groups_path
	end

	def new
		@group = Group.new
	end

	def create
		@group=Group.new(group_params)
		@group.active = true
		@group.owner = current_user.id

		if @group.save
			groupset = Groupset.new
			groupset.user_id = current_user.id
			groupset.group_id = @group.id
			groupset.points_in_group = 0
			groupset.save


			redirect_to group_path(@group.id), notice: 'Dodano grupę.'
		else
			render :new
		end
	end

		private
			def group_params
				params.require(:group).permit(:name)		
			end

			def par
				params.require(:group).permit(:id)
			end

end