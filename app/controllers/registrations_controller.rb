class RegistrationsController < Devise::RegistrationsController

  def new
    @token = params[:invite_token]
    super
  end

  def create
    # add custom create logic here
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

  def update
    super
  end
  
end 