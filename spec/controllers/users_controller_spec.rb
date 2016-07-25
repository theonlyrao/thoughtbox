require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders new user page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "creates a new user" do
      post :create, { user: {email: "controller_test@email.com", password: "password", confirmation: "password"} }

      expect(User.last.email).to eq("controller_test@email.com")
    end
  end
  
end
