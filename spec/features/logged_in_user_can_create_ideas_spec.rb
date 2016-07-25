require 'rails_helper'

RSpec.feature "LoggedInUserCanCreateIdeas", type: :feature do
  scenario "user has account and is logged in", js: true do
    email = "brand@new.com"
    user = User.create(email: email, password: "password")
    visit login_path
    fill_in "Email", with: email
    fill_in "Password", with: "password"
    click_on "Login"

    visit links_index_path

    within(".new-idea-form") do
      fill_in "Title", with: "Test Idea"
      fill_in "Url:", with: "www.google.com"
      click_on "Save link"
    end

    within(".idea-list") do
      expect(page).to have_content("Test Idea")
      expect(page).to have_content("www.google.com")
    end
    
    
  end
end
