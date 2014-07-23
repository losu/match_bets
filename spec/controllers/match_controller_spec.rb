require "rails_helper"

RSpec.describe MatchesController, type: :controller do
	before(:each) do
		@user = User.create(email:'test@test.pl', password:'testpassword')
		sign_in @user
	end

	describe "GET #index" do
		it "should render properyly with status 200" do
			get :index
			expect(response).to be_succes
			expect(response).to have_http_status(200)
		end

		it 'should render index template' do
			get :index
			expect(response).to render_template('index')
		end

		# it 'should have @posts with all posts' do
  #   	match1=Match.create(team_name_1: "name1", team_name_2: 'name2')
  #    	match2=Match.create(team_name_1: "name1", team_name_2: 'name2')
  #     get :index
  #     expect(assigns(:matches)).to match_array([match1, match2])
  # 	end

	end
	
end
