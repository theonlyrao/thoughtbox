require 'rails_helper'

RSpec.feature "AnonymousUserDoesNotSeeLinks", type: :feature do
  describe "anonymous user" do
    it "does not see links" do
      visit root_path
      within(".header") do
        expect(page).not_to have_content("Links")
      end
    end

    it "is redirected to home when visiting links" do
      visit links_index_path
      expect(current_path).to eq(root_path)
    end
  end
end
