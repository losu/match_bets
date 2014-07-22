require 'rails_helper'


RSpec.describe UsersController, type: :controller do
	 describe "sign_in" do
	 it 'should sign in user' do
	  
	  	@user=User.create(email: "test@test.pl", password: "testpassword")

	    sign_in @user
	    expect(response).to be_success
	 end
end

end