require 'rails_helper'
RSpec.feature "LoggedInUserSeesLogoutLink", type: :feature do
  # before(:context) do
  #   RSpec::Mocks.with_temporary_scope do
  #     user = User.create(email: "another@email.com", password: "awesomepassword")
  #     ApplicationController.any_instance.stubs(:current_user).returns(user)      
  #   end
  # end
  
  describe "visiting links index" do
    # context "as a logged in user" do
    #   it "sees signout link on links index" do
    #       user = User.create(email: "another@email.com", password: "awesomepassword")
    #       ApplicationController.any_instance.stubs(:current_user).returns(user)


    #       visit links_index_path
    #       within(".header") do
    #         expect(page).to have_content("Sign Out")
    #         click_on "Sign Out"
    #       end

    #       expect(current_path).to eq(login_path)
    #     end

    # end
  end
end
