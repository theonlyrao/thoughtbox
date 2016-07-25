require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:email) }
  it { should have_secure_password }
  
  it "has email and password" do
    email = "new_email@example.com"
    password = "password"
    new_user = User.create(email: email, password: password)

    expect(User.count).to eq(1)
    expect(User.first.email).to eq(email)
  end
  
end
