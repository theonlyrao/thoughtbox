require 'rails_helper'

RSpec.feature "UserCanEditLinks", type: :feature do

  scenario "user has account and is logged in", js: true do
    email = "wow@new.com"
    user = User.create(email: email, password: "password")
    ApiController.any_instance.stubs(:current_user).returns(user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)        

    google = Link.create(title: "google", address: "http://www.google.com")
    user.links << google
    
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

    expect(Link.last.title).to eq("old google")
  end

  scenario "user gives bad url", js: true do
    email = "wowbsdf@new.com"
    user = User.create(email: email, password: "password")
    ApiController.any_instance.stubs(:current_user).returns(user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)        

    bing = Link.create(title: "bing", address: "http://www.bing.com")
    user.links << bing
    
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
