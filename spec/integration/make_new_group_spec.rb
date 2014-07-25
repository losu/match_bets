require 'spec_helper'
include Capybara::DSL
require 'capybara/rspec'

describe "make new group:" do
  before :each do
    @user=User.create(email: "test@example.com", password: "qwerty12345")
    visit '/users/sign_in'
    fill_in 'user_email',        :with => "test@example.com"
    fill_in 'user_password',     :with => "qwerty12345"
    find_button('Sign in').click
  end

  it 'create new group' do
    visit '/groups/new'
    fill_in 'group_name',  :with => "uber grupa 9000"
    find_button('Dodaj!').click
    expect(page).to have_content ("Dodano grupę")
  end
end