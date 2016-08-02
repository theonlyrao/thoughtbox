require 'rails_helper'

RSpec.feature "UserCanLogOut", type: :feature do
  it "logs user out" do
    user = User.create(email: "user@example.com", password: "password")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit links_index_path
    click_on "Sign Out"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("You have signed out.")
  end
end
