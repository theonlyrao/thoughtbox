require 'rails_helper'

RSpec.describe User, type: :model do
  it "has email and password" do
    email = "new_email@example.com"
    password = "password"
    new_user = User.create(email: email, password_hash: password)

    expect(User.count).to eq(1)
    expect(User.first.email).to eq(email)
  end
  
end
