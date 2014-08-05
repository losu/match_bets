# coding: UTF-8

class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new  
  end

  def show
    @id = params[:id]
    @tournament = Tournament.find(params[:id])
    @matches = Match.where(tournament_id: @id)
    @free_matches = Match.where(tournament_id: nil)
  end

  def addmatch
    @match = Match.find(params[:match_id])
    @tournament_id = params[:id]
    @match.tournament_id = @tournament_id
    @match.save
    redirect_to tournament_path(@tournament_id)
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      redirect_to tournaments_path
    else
      render :new
    end
  end

  private 

  def tournament_params
    params.require(:tournament).permit(:name)    
  end

end
