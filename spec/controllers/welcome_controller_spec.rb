require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index for anonymous user" do
    it "renders the new user page" do
      get :index
      expect(response).to render_template(:sign_in)
    end
  end
end
