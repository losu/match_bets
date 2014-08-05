require "rails_helper"

RSpec.describe BetsController, type: :controller do
    before(:each) do
        @user = User.create(email:'test@test.pl', password:'testpassword',admin: true)
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
    end
end
