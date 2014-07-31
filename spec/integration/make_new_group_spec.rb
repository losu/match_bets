require 'spec_helper'
include Capybara::DSL
require 'capybara/rspec'

describe "make new group:" do
  before :each do
    @user=User.create(id: 777, email: "test@example.com", password: "qwerty12345", admin: true)
    visit '/users/sign_in'
    fill_in 'user_email',        :with => "test@example.com"
    fill_in 'user_password',     :with => "qwerty12345"
    find_button('Sign in').click
    # sign_in @user
  end

  it 'create new group' do
    visit '/groups/new'
    fill_in 'group_name',  :with => "uber grupa 9000"
    # print page.html
    find_button('Add!').click
    # click_on("add_button")
    # page.find("#add_button").click
    # find('#add_button',:visible => true).click
    # find("#add_button").click
    expect(page).to have_content ("Dodano grupę")
  end
end