require "rails_helper"

RSpec.describe Match, type: :model do

  it 'should have attributes :team_name_1, team_name_2, team_score_1, team_score_2, deadline' do 
    expect(subject.attributes).to include('team_name_1', 'team_name_2', 'team_score_1', 'team_score_2')
  end

  it 'should validate team_name_1, team_name_2, team_score_1, team_score_2, deadline' do 
    expect(Match.new).not_to be_valid
    expect(Match.new(team_name_1: "team_name_1", team_name_2: "team_name_2",team_score_1: "0", team_score_2: "0")).to be_valid
  end
end
