require "rails_helper"
!
RSpec.describe Tournament, type: :model do
  it 'should have :name' do
    expect(subject.attributes).to include('name')
  end

  it 'should require :name' do
    expect(Tournament.new).not_to be_valid
    expect(Tournament.new(name: "ełro 2055")).to be_valid
  end

  it "should has many matches" do
    t = Tournament.reflect_on_association(:matches)
    expect(t.macro).to equal :has_many
  end

end