class RegistrationsController < Devise::RegistrationsController

  def new
    super
    @token = params[:invite_token]
  end

  def create
    # add custom create logic here
    super
    if resource.save
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
  end

  def update
    super
  end
end 