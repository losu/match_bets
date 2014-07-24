#coding UTF-8

class MatchesController < ApplicationController
	before_action :authenticate_user!, only: [ :new, :create]

	def index
		@matches = Match.all
	end

	def show
		@match = Match.find(params[:id])
	end

	def delete
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
		if @match.save
			redirect_to matches_path
			UserMailer.welcome_email(@user).deliver
 
        	#format.html { redirect_to(@user, notice: 'User was successfully created.') }
        	#format.json { render json: @user, status: :created, location: @user }
		else
			render:new
		end
	end

	private
		def match_params
			params.require(:match).permit(:team_name_1, :team_name_2, :deadline, :team_score_1, :team_score_2)
		end

end