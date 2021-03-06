require 'spec_helper'
include Capybara::DSL
require 'capybara/rspec'

describe "log in without facebook:" do
	before :each do
    @user=User.create(email: "test@example.com", password: "qwerty12345")
	end
  it "signs me in" do
  	visit '/users/sign_in'
    fill_in 'user_email',        :with => "test@example.com"
    fill_in 'user_password',     :with => "qwerty12345"
    find_button('Sign in').click
    expect(page).to have_content ('Signed in successfully')
  end
end