# coding: UTF-8

class MatchesController < ApplicationController
	before_action :authenticate_user!, only: [ :new, :create]
	before_action :check_if_admin

	def index
			@matches = Match.all
	end

	def show
			@match = Match.find(params[:id])
	end

	def destroy
		@match = Match.find(param[:id])
		@match.destroy
		redirect_to root_url
	end

	def new
			@match = Match.new
	end

	def create
		@user = current_user
		@match = Match.new(match_params)
		@match.team_score_1 = 0
		@match.team_score_2 = 0
		if @match.save
			redirect_to matches_path
		else
			render :new
		end
	end

	def update
		match = Match.find(params[:id])
		if match_params[:team_score_2] && match_params[:team_score_1]
			match.team_score_1 = match_params[:team_score_1]
			match.team_score_2 = match_params[:team_score_2]
		end
		if match_params[:deadline]
			match.deadline = match_params[:deadline]
		end
		if match_params[:team_name_1] && match_params[:team_name_2]
			match.team_name_1 = match_params[:team_name_1]
			match.team_name_2 = match_params[:team_name_2]
		end
		if match.save
			redirect_to matches_path, notice: 'saved'
		else
			redirect_to matches_path, alert: match.errors.full_messages
		end 
	end

	def evaluate_for_match
		@match = Match.find(params[:id])
		if @match 
			@match.evaluate_points
			@groups=Group.all
			unless @groups.count == 0
				@groups.each do |g|
					g.create_ranking
				end
			end
			redirect_to matches_path, notice: 'evaluated properly'
		else
			redirect_to matches_path, alert: @match.errors.full_message.first
		end
	end

	def evaluate_all_matches
		@matches = Match.all
		unless @matches.count == 0
			@matches.each do |match|
				if match.deadline < Time.now
					match.evaluate_points
				end
			end
			@groups=Group.all
			unless @groups.count == 0
				@groups.each do |g|
					g.create_ranking
				end
			end
			redirect_to matches_path, notice: 'evaluated properly'
		else
			redirect_to matches_path, alert: 'not evaluated'
		end
	end

	private

	def match_params
		params.require(:match).permit(:team_name_1, :team_name_2, :team_score_1, :team_score_2, :deadline)
	end

	def check_if_admin
		unless current_user.admin
			redirect_to root_url, alert: "You don't have permission to do this"
		end
	end

end