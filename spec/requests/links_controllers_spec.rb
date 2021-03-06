require 'rails_helper'

RSpec.describe "LinksControllers", type: :request do
  describe "POST new link" do
    it "create a new link" do
      user = User.create(email: "hello@world.com", password: "password")
      ApiController.any_instance.stubs(:current_user).returns(user)
      post "/api/v1/links", link: { title: "new link", address: "http://www.yahoo.com" }
      link = JSON.parse(response.body)

      expect(Link.last.title).to eq(link["title"])
      expect(Link.last.address).to eq(link["address"])
    end
  end
end
