require 'rails_helper'

RSpec.describe User, :type => :model do
  
  it 'should have attributes :admin, nickname, email' do 
    expect(subject.attributes).to include('admin', 'nickname', 'email')
  end
  it 'should validate attributes nickname, email' do 
    expect(User.new(password: 'qwerty12345')).not_to be_valid
    expect(User.new(email: 'example@test.com')).not_to be_valid
    expect(User.new(email: 'example@test.com', password: 'qwerty12345')).to be_valid
  end

end
