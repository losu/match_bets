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
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      redirect_to tournaments_path
    else
      render:new
    end
  end

  def tournament_params
    params.require(:tournament).permit(:name)    
  end

end
