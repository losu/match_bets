require 'spec_helper'
include Capybara::DSL
require 'capybara/rspec'

describe "evaluate points:" do
  before :each do
    @user1=User.create(id: 5, email: "test@example.com", password: "qwerty12345", admin: true)
    @user2=User.create(id: 15, email: "testowy@example.com", password: "qwerty12345")
    visit '/users/sign_in'
    fill_in 'user_email',        :with => "test@example.com"
    fill_in 'user_password',     :with => "qwerty12345"
    find_button('Sign in').click
  end

  it 'generate points in all bets' do
    group=Group.create(id: 1, name: "ubergrupa", active: true, owner: 5)
    match=Match.create(id: 10, team_name_1: "san marino", team_name_2: "korea północna", deadline: (Time.now - 1.day), team_score_1: 0, team_score_2: 0)
    groupset1=Groupset.create(id: 7, group_id: group.id, user_id: @user1.id, points_in_group: 0)
    groupset2=Groupset.create(id: 77, group_id: group.id, user_id: @user2.id, points_in_group: 0)
    bet1=Bet.create(id: 9, match_id: match.id, user_id: @user1.id, group_id: group.id, team_score1: 0, team_score2: 7, points: 0)
    bet2=Bet.create(id: 99, match_id: match.id, user_id: @user1.id, group_id: group.id, team_score1: 0, team_score2: 0, points: 0)
    bet3=Bet.create(id: 999, match_id: match.id, user_id: @user2.id, group_id: group.id, team_score1: 7, team_score2: 0, points: 0)
    bet4=Bet.create(id: 9999, match_id: match.id, user_id: @user2.id, group_id: group.id, team_score1: 2, team_score2: 2, points: 0)
    match.evaluate_points
    group.create_ranking
    expect(bet2.points).to eq(4)
    expect(groupset2.points_in_group).to eq(1)
  end
end