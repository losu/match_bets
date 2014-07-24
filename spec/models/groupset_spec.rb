require "rails_helper"
!
RSpec.describe Groupset, type: :model do
  it 'should have :group_id, :user_id, :points_in_group' do
    expect(subject.attributes).to include('group_id')
    expect(subject.attributes).to include('user_id')
    expect(subject.attributes).to include('points_in_group')
  end

  it 'should require :group_id, :user_id' do
    expect(Groupset.new).not_to be_valid
    expect(Groupset.new(group_id: 1)).not_to be_valid
    expect(Groupset.new(user_id: 1)).not_to be_valid
    expect(Groupset.new(group_id: 1, user_id: 1)).to be_valid
  end

  it "should belong to user" do
    t = Groupset.reflect_on_association(:user)
    expect(t.macro).to equal :belongs_to
  end

  it "should belong to group" do
    t = Groupset.reflect_on_association(:group)
    expect(t.macro).to equal :belongs_to
  end

end