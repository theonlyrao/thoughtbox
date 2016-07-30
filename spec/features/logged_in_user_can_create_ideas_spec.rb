require 'rails_helper'

RSpec.feature "LoggedInUserCanCreateIdeas", type: :feature do
  scenario "user has account and is logged in", js: true do
    email = "brand@new.com"
    user = User.create(email: email, password: "password")
    ApiController.any_instance.stubs(:current_user).returns(user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)        
    visit login_path
    fill_in "Email", with: email
    fill_in "Password", with: "password"
    click_on "Login"

    visit links_index_path

    within(".new-link-form") do
      fill_in "Title", with: "Test Idea"
      fill_in "Url:", with: "http://www.google.com"
      click_on "Save link"
    end

    within(".link-list") do
      expect(page).to have_content("Test Idea")
      expect(page).to have_content("http://www.google.com")
    end
  end

  scenario "submits invalid link", js: true do
    email = "again@new.com"
    user = User.create(email: email, password: "password")
    ApiController.any_instance.stubs(:current_user).returns(user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)        
    visit login_path
    fill_in "Email", with: email
    fill_in "Password", with: "password"
    click_on "Login"

    visit links_index_path

    within(".new-link-form") do
      fill_in "Title", with: "Test Idea"
      fill_in "Url:", with: "google.com"
      click_on "Save link"
    end

    expect(page).to have_content("Submit complete url, including http://www...")

  end
  
end
