require 'spec_helper'
include Capybara::DSL
require 'capybara/rspec'
include Warden::Test::Helpers

describe "create tournament:" do
  before :each do
    @user=User.create(id: 5, email: "test@example.com", password: "qwerty12345", admin: true, nickname: "uberuser")
    visit '/users/sign_in'
    fill_in 'user_email',               :with => "test@example.com"
    fill_in 'user_password',            :with => "qwerty12345"
    find_button('Sign in').click
  end

  it 'adds matches to tournament and group' do
    click_link('My groups')
    click_link('Create group')
    fill_in 'group_name',               :with => "uber grupa 9000"
    find_button('Add!').click
    click_link('Administrator panel')
    click_link('Add new match')
    fill_in 'match_team_name_1',        :with => "ełro tim 1"
    fill_in 'match_team_name_2',        :with => "ełro tim 2"
    fill_in 'datetimepicker',           :with => "2015/01/01 12:34"
    find_button('Add!').click
    click_link('Administrator panel')
    click_link('Add new match')
    fill_in 'match_team_name_1',        :with => "ełro tim 3"
    fill_in 'match_team_name_2',        :with => "ełro tim 4"
    fill_in 'datetimepicker',           :with => "2015/01/01 12:34"
    find_button('Add!').click
    click_link('Administrator panel')
    click_link('Add tournament')
    fill_in 'tournament_name',           :with => "euro"
    find_button('Add!').click
    click_link('euro')
    find_button('Add match').click
    page.find('a', :text => "ełro tim 1 vs ełro tim 2").click
    page.find('a', :text => 'ełro tim 3 vs ełro tim 4').click
    click_link('My groups')
    click_link('uber grupa 9000')
    find_button('Add Tournament').click
    page.find('a', :text => "euro").click
    expect(page).to have_content("Bet!")
  end
end