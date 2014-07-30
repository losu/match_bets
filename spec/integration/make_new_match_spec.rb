require 'spec_helper'
include Capybara::DSL
require 'capybara/rspec'

describe "make new match:" do
  before :each do
    @user=User.create(email: "test@example.com", password: "qwerty12345", admin: true)
    visit '/users/sign_in'
    fill_in 'user_email',        :with => "test@example.com"
    fill_in 'user_password',     :with => "qwerty12345"
    find_button('Sign in').click
  end

  it 'create new match' do
    visit '/matches/new'
    fill_in 'match_team_name_1',  :with => "san marino"
    fill_in 'match_team_name_2',  :with => "korea północna"
    fill_in 'datetimepicker',     :with => "2015/01/01 12:34"
    find_button('Add!').click
    expect(page).to have_content ("Matches list:")
  end
end