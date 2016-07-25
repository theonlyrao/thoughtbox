require 'rails_helper'

RSpec.feature "UserCanLogins", type: :feature do
  describe "user with account" do
    it "can log in" do
      email = "has_account@email.com"
      password = "strongpassword"
      user = User.create(email: email, password: password )

      visit login_path
      within(".login-form") do
        fill_in "Email", with: email
        fill_in "Password", with: password
        click_on "Login"
      end

      expect(current_path).to eq links_index_path
      save_and_open_page
      within(".header") do
        expect(page).to have_content("Sign Out")
      end
    end
  end
end
