require "rails_helper"
!
RSpec.describe Bet, type: :model do
	it 'should have :match_id, :group_id, :user_id, :team_score1, :team_score2' do
		expect(subject.attributes).to include('group_id')
		expect(subject.attributes).to include('user_id')
		expect(subject.attributes).to include('match_id')
		expect(subject.attributes).to include('team_score2')
		expect(subject.attributes).to include('team_score1')
	end

	it 'should require :match_id, :group_id, :user_id, :team_score1, :team_score2' do
		expect(Bet.new).not_to be_valid
		expect(Bet.new(group_id: 1, user_id: 1, team_score1: 1, team_score2: 1)).not_to be_valid
		expect(Bet.new(match_id: 1, user_id: 1, team_score1: 1, team_score2: 1)).not_to be_valid
		expect(Bet.new(match_id: 1,group_id: 1, team_score1: 1, team_score2: 1)).not_to be_valid
		expect(Bet.new(match_id: 1,group_id: 1, user_id: 1, team_score2: 1)).not_to be_valid
		expect(Bet.new(match_id: 1,group_id: 1, user_id: 1, team_score1: 1 )).not_to be_valid
		expect(Bet.new(match_id: 1,group_id: 1, user_id: 1, team_score1: 1, team_score2: 1)).to be_valid	
	end

	it "should belong to user" do
		t = Bet.reflect_on_association(:user)
		expect(t.macro).to equal :belongs_to
	end

	it "should belong to group" do
		t = Bet.reflect_on_association(:group)
		expect(t.macro).to equal :belongs_to
	end

	it "should belong to match" do
		t = Bet.reflect_on_association(:match)
		expect(t.macro).to equal :belongs_to
	end

end