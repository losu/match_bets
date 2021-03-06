# coding: UTF-8

class RegistrationsController < Devise::RegistrationsController

  def new
    @token = params[:invite_token]
    super
  end

  def create
    super

    @token = params[:invite_token]
  	if @token != nil
     	org =  Invite.find_by_token(@token).group_id
     	groupset = Groupset.new
	 	  groupset.user_id = resource.id
	 		groupset.group_id = org
	 		groupset.points_in_group = 0
	 		groupset.save
	 	end
  end

  def destroy
    Groupset.find_by(user_id: resource.id).destroy
    super
  end

  def update
    super
  end
  
end 