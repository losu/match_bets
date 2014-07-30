require 'spec_helper'
include Capybara::DSL
require 'capybara/rspec'

describe "check admin validations:" do
before :each do
    @user=User.create(id: 5, email: "test@example.com", password: "qwerty12345", admin: false)
    visit '/users/sign_in'
    fill_in 'user_email',        :with => "test@example.com"
    fill_in 'user_password',     :with => "qwerty12345"
    find_button('Sign in').click
  end

  it 'tries do add match' do
    visit '/matches/new'
    expect(page).to have_content ("ALERT!: You don't have permission to do this")
    visit '/matches/1'
    expect(page).to have_content ("ALERT!: You don't have permission to do this")
    visit '/matches'
    expect(page).to have_content ("ALERT!: You don't have permission to do this")
    # visit '/matches/1/edit'
    # expect(page).to have_content ("ALERT!: You don't have permission to do this")
    page.driver.submit :delete, '/matches/1', {}
    expect(page).to have_content ("ALERT!: You don't have permission to do this")
  end
  
end