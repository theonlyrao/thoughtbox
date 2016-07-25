require 'rails_helper'

RSpec.feature "UserCanEditLinks", type: :feature do

  scenario "user has account and is logged in", js: true do
    email = "wow@new.com"
    user = User.create(email: email, password: "password")
    visit login_path
    fill_in "Email", with: email
    fill_in "Password", with: "password"
    click_on "Login"

    google = Link.create(title: "google", address: "http://www.google.com")

    visit links_index_path

    within(".link-list") do
      expect(page).to have_content("http://www.google.com")
      click_on "Edit"
    end

    expect(current_path).to eq link_path(google)

    within(".link-info") do
      fill_in "Title", with: "old google"
      fill_in "Address", with: "http://www.yahoo.com"
      click_on "Update Link"
    end

    click_on "Back to Link Index"

    expect(page).to have_content("old google")
  end

  scenario "user gives bad url", js: true do
    email = "wowbsdf@new.com"
    user = User.create(email: email, password: "password")
    visit login_path
    fill_in "Email", with: email
    fill_in "Password", with: "password"
    click_on "Login"

    bing = Link.create(title: "bing", address: "http://www.bing.com")

    visit links_index_path

    within(".link-list") do
      expect(page).to have_content("http://www.bing.com")
      click_on "Edit"
    end

    expect(current_path).to eq link_path(bing)

    within(".link-info") do
      fill_in "Title", with: "old google"
      fill_in "Address", with: "yahoo"
      click_on "Update Link"
    end

    expect(current_path).to eq link_path(bing)
    expect(page).to have_content("Address is not a valid URL")
  end


end
