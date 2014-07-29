#coding: UTF-8

class GroupsController < ApplicationController
		before_action :authenticate_user! #, only: [ :new, :create]
		helper_method :sendmail

	def index
		@token = params[:invite_token]
		if @token != nil
     		org =  Invite.find_by_token(@token).group_id
     		email = Invite.find_by_token(@token).email
     		
     		if email == current_user.email
     			groupset = Groupset.new
	 	  		groupset.user_id = current_user.id
	 			groupset.group_id = org
	 			groupset.points_in_group = 0
	 			groupset.save
	 		end
	 	end
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])
		@invite = Invite.new
		@id = params[:id]
		@matches = Match.where('deadline >= :time', :time=>Time.now)
	end

	def new
		@group = Group.new
	end

	def add
		@token = params[:invite_token]
		if @token != nil
     		org =  Invite.find_by_token(@token).group_id
     		groupset = Groupset.new
	 	  	groupset.user_id = resource.id
	 		groupset.group_id = org
	 		groupset.points_in_group = 0
	 		groupset.save
	 	end
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