#codding: UTF-8

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  #before_action :make_sure_its_mine
  
  def index
    @user=User.all  
    @groupset = Group.where(user_id: current_user.id)
  end

  def show
    @user=current_user
  end

  def create
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # private
  #  def make_sure_its_mine
  #    unless current_user.id==params[:id].to_i
  #      redirect_to root_url, alert: "To nie twoje konto!"
  #     end
  #     true
  #   end
end