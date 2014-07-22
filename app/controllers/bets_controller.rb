#coding UTF-8

class BetsController < ApplicationController
	def new
		@bet=Bet.new

	end

	def create
		@bet=Bet.new(bet_params)
		@bet.user_id = current_user.id 
		@bet.group_id = params[:bet][:group_id]
		@bet.match_id = params[:bet][:match_id]
		if @bet.save
			redirect_to root_url, notice: "utworzono zakład"
		else
			render 'new'
		end
	end

	private 
	def bet_params
		params.require(:bet).permit(:match_id, :user_id, :group_id, :team1_score, :team2_score)
	end


end