require 'rails_helper'

RSpec.describe Link, type: :model do
  it "has default read status of false" do
    link = Link.create(title: "tester", address: "http://www.link.com")

    expect(link.read).to eq(false)
  end
end
