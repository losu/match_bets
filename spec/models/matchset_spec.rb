require "rails_helper"
!
RSpec.describe Matchset, type: :model do
  it 'should have :group_id, :match_id' do
    expect(subject.attributes).to include('group_id')
    expect(subject.attributes).to include('match_id')
  end

  it 'should require :group_id, :match_id' do
    expect(Matchset.new).not_to be_valid
    expect(Matchset.new(group_id: 1)).not_to be_valid
    expect(Matchset.new(match_id: 1)).not_to be_valid
    expect(Matchset.new(group_id: 1, match_id: 1)).to be_valid
  end

  it "should belong to match" do
    t = Matchset.reflect_on_association(:match)
    expect(t.macro).to equal :belongs_to
  end

  it "should belong to group" do
    t = Matchset.reflect_on_association(:group)
    expect(t.macro).to equal :belongs_to
  end

end