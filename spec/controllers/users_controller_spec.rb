require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders new user page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "creates a new user with valid info" do
      post :create, { user: {email: "controller_test@email.com", password: "password", confirmation: "password"} }

      expect(User.last.email).to eq("controller_test@email.com")
    end

    it "creates logged in user with info" do
      post :create, { user: {email: "controller_test_two@email.com", password: "password", confirmation: "password"} }
      last_user = User.last
      current_user = User.find(session[:user])

      expect(current_user).to eq(last_user)
      expect(current_user.password).to eq("password")
    end

  end
  
end
