require 'rails_helper'

RSpec.describe "As a guest" do
  context "When I visit /user/new" do
    it "I can create an account" do
      user = User.new(email: 'test@example.com', password_digest: 'test')
      visit new_user_path

      fill_in :email, with: user.email
      fill_in :password, with: user.password_digest
      fill_in :password_confirmation, with: user.password_digest
      click_on "Create Account"

      expect(User.count).to eq(1)
      expect(User.first.email).to eq(user.email)
    end
  end
end
