require "rails_helper"
!
RSpec.describe Group, type: :model do
	it 'should have :name, :active, :owner' do
		expect(subject.attributes).to include('name')
		expect(subject.attributes).to include('active')
		expect(subject.attributes).to include('owner')
	end

	it 'should require :name, :owner' do
		expect(Group.new()).not_to be_valid
		expect(Group.new(name: "Group")).not_to be_valid
		expect(Group.new(owner: 1)).not_to be_valid
		expect(Group.new(name: "Group", owner: 1)).to be_valid
	end

	it "should belong to users through groupsets" do
		t = Group.reflect_on_association(:users)
		expect(t.macro).to equal :has_many 
	end

end