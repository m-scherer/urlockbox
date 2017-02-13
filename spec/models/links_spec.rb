require 'rails_helper'

RSpec.describe Link, type: :model do
  context '#valid_url?' do
    it "validates a good url" do
      link = Link.new(title: "test", url: "http://www.google.com")

      expect(link.valid_url?).to eq(true)
    end
    it "can handle https" do
      link = Link.new(title: "test", url: "https://www.google.com")

      expect(link.valid_url?).to eq(true)
    end
    it "invalidates a bad url" do
      link = Link.new(title: "test", url: "www.google.com")

      expect(link.valid_url?).to eq(false)
    end
  end
end
