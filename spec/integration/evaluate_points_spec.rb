require 'spec_helper'
include Capybara::DSL
require 'capybara/rspec'
include Warden::Test::Helpers

describe "evaluate points:" do
  before :each do
    @user=User.create(id: 5, email: "test@example.com", password: "qwerty12345", admin: true, nickname: "uberuser")
    visit '/users/sign_in'
    fill_in 'user_email',               :with => "test@example.com"
    fill_in 'user_password',            :with => "qwerty12345"
    find_button('Sign in').click
  end

  it 'generate points in all bets' do
    click_link('My groups')
    click_link('Create group')
    fill_in 'group_name',               :with => "uber grupa 9000"
    find_button('Add!').click
    click_link('Administrator panel')
    click_link('Add new match')
    fill_in 'match_team_name_1',        :with => "aaa"
    fill_in 'match_team_name_2',        :with => "bbb"
    fill_in 'datetimepicker',           :with => "2015/01/01 12:34"
    find_button('Add!').click
    click_link('My groups')
    click_link('uber grupa 9000')
    find_button('Add match').click
    page.find('a', :text => 'aaa vs bbb').click
    # find('aaa vs bbb').click
    click_link('Bet!')
    fill_in 'bet_team_score1',          :with => "0"
    fill_in 'bet_team_score2',          :with => "0"
    find_button('Add!').click
    click_link('Administrator panel')
    click_link('List of matches')
    click_link('evaluate')
    click_link('My groups')
    click_link('uber grupa 9000')
    find_button('Show Rank !').click
    # print page.html
    # page.find('th', :text => 'Nickname')
    # expect(page).to have_selector('th', text: "4")
    expect(page).to have_content("Nickname")
    expect(page).to have_content("Score")
    expect(page).to have_content("uberuser")
    expect(page).to have_content("4")
  end
end