#codding: UTF-8

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  #before_action :make_sure_its_mine
  
  def index
    @user=User.all  
  end

  def show
    @user=current_user
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
    
  def new
    @token = params[:invite_token]
  end


  private 
  def user_params
    params.require(:user).permit(:name,:nickname)
  end
  # private
  #  def make_sure_its_mine
  #    unless current_user.id==params[:id].to_i
  #      redirect_to root_url, alert: "To nie twoje konto!"
  #     end
  #     true
  #   end
end