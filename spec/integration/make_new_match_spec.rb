# require 'spec_helper'
# include Capybara::DSL
# require 'capybara/rspec'

# describe "make new match" do
#   # before :each do
#  #      User.new(email: "user@example.com", password: "qwerty12345", admin: false, nickname: "cokolwiek")
#   # end
#   it "creating new match" do
#     visit 'matches/new'
#     # within ("#user") do
#     print page.html
#       fill_in 'match_team_name_1', :with => "jedno"
#       fill_in 'match_team_name_2', :with => "drugie"
#     # print page.html
#       # fill_in 'user_email', :with => "tytus.powroznik@gmail.com"
#      #  fill_in 'user_password', :with => "qwerty12345"

#     # end
#     click_button 'Dodaj'
#     # find_button('Sign in').click
#     # save_and_open_page

#     expect(page).to have_content ('Lista meczów:')
#   end
# end