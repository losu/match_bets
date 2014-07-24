require 'spec_helper'
include Capybara::DSL
require 'capybara/rspec'

describe "log in without facebook" do
	before :each do
  		User.new(email: "user@example.com", password: "cokolwiek")
	end
  it "signs me in" do
  	visit '/users/sign_in'
      within ("#user") do
      	fill_in 'Email', :with => 'user@example.com'
        	fill_in 'Password', :with => 'password'
        end
        click_button 'Sign in'
        expect(page).to have_content 'Dodaj mecz'
    end
end