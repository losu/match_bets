#coding UTF-8

class MatchesController < ApplicationController
	before_action :authenticate_user!, only: [ :new, :create]
	before_action :check_id_admin, only: [ :new, :create]

	def index
		@matches = Match.all
	end

	def sendmail

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
		else
			render:new
		end
	end

	private
		def match_params
			params.require(:match).permit(:team_name_1, :team_name_2, :deadline, :team_score_1, :team_score_2)
		end

		def check_if_admin
			unless current_user.admin
				redirect_to root_url, alert: 'Nie masz uprawnień!'
			end
		end

end