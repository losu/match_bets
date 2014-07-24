require "rails_helper"
!
RSpec.describe Group, type: :model do
	it 'should have :name' do
		expect(subject.attributes).to include('name')
	end

	it 'should require name' do
		expect(Group.new(name: "")).not_to be_valid
		expect(Group.new(name: "Group")).to be_valid
	end

	it "should belong to users through groupsets" do
		t = Group.reflect_on_association(:users)
		expect(t.macro).to equal :has_many 
	end

end