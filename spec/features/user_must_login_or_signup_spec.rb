require 'rails_helper'

RSpec.feature "UserMustLoginOrSignup", type: :feature do
  describe "unauthenticated user" do
    it "gets prompted to sign up or login when visiting root" do
      visit root_path

      within("h1") do
        expect(page).to have_content("Log In or Sign Up")
      end
    end

    it "can sign up" do
      visit root_path

      within(".sign-up") do
        click_on "Sign Up"
      end

      expect(current_path).to eq sign_up_path
      within(".new-user") do
        fill_in "Email", with: "new@email.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on "Create Account"
      end

      expect(current_path).to eq links_index_path
    end
    
  end
end
