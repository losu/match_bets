#coding: UTF-8

class GroupsController < ApplicationController
		before_action :authenticate_user! #, only: [ :new, :create]
		helper_method :sendmail

	def index
		@token = params[:invite_token]
		if @token != nil
     		org =  Invite.find_by_token(@token).group_id
     		email = Invite.find_by_token(@token).email
      		check_groupset = Groupset.where(group_id: org, user_id: current_user.id)
      		if email == current_user.email
     			if check_groupset.blank?
     				groupset = Groupset.new
	 	  			groupset.user_id = current_user.id
	 				groupset.group_id = org
	 				groupset.points_in_group = 0
	 				groupset.save
	 			end
	 		end
	 	end
		@groups = Group.all
	end

	def add
		@group_id = params[:group_id]
		@match_id = params[:match_id]
		if Match.find(@match_id).deadline > Time.now
			@matchset = Matchset.new
			@matchset.group_id = @group_id
			@matchset.match_id = @match_id
			@matchset.save
		end
		redirect_to group_path(@group_id)
	end

	def show
		@group = Group.find(params[:id])
		@invite = Invite.new
		@id = params[:id]
		@groupsets = Groupset.where(group_id: @id)
		@bets = Bet.where(group_id: @id, user_id: current_user.id)

		
		# ----- Available matches table ---------
		matchsets = Matchset.where(group_id: @id)
		@bet_visible = {}
		@match_array = []
		if matchsets.count > 0
			matchsets.each do |matchset|
				match = Match.find(matchset.match_id)
				@match_array << match

				bet = Bet.where(group_id:  @id, match_id:  match.id, user_id:  current_user.id)
				if bet.blank?
					@bet_visible[match.id] = true
				else
					@bet_visible[match.id] = false
				end	
			end
		end
		#---------------------------------------

		#-----Add match to group----------------
		@matches = Match.where('deadline >= :time', :time=>Time.now)
		@find_matches = Matchset.where(group_id: @id)
		@matchset_exist = {}

		@matches.each do |match|
			find_matchset = Matchset.where(group_id: @id, match_id: match.id)
			if find_matchset.blank?
				@matchset_exist[match.id] = true
			else
				@matchset_exist[match.id] = false
			end	
		end
		#---------------------------------------
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