# coding: UTF-8

class BetsController < ApplicationController
	before_action :authenticate_user!

	def index; end

	def new
		@bet=Bet.new
	end

	def create
		@bet=Bet.new(bet_params)
		@bet.user_id = current_user.id 
		@bet.group_id = params[:bet][:group_id]
		@bet.match_id = params[:bet][:match_id]
		
		if @bet.save
			redirect_to group_path(params[:bet][:group_id]), notice: "utworzono zakład"
		else
			render 'new', notice: "nie poszla walidacja" 
		end
	end

	private 

	def bet_params
		params.require(:bet).permit(:match_id, :user_id, :group_id, :team_score1, :team_score2)
	end
end