# coding: UTF-8

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @user=User.all
    gon.match_list = Match.all
  end

  def show
    @user=current_user
  end

  def new
    @token = params[:invite_token]
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path notice: "Edytowano!"
    else 
      render 'edit'
    end
  end
    
  def new
    @token = params[:invite_token]
  end

  private 
  
  def user_params
    params.require(:user).permit(:name,:nickname)
  end
end