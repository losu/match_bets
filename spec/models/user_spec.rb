require 'rails_helper'

RSpec.describe User, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  it 'should have attributes :admin, nickname, email' do 
    expect(subject.attributes).to include('admin', 'nickname', 'email')
  end
end
