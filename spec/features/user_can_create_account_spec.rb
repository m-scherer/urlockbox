require 'rails_helper'

RSpec.describe "As a guest" do
  context "When I visit /users/new" do
    it "I can create an account" do
      user = User.new(email: 'test@example.com', password_digest: 'test')
      visit new_user_path

      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password_digest
      fill_in :user_password_confirmation, with: user.password_digest
      click_on "Create User"

      expect(User.count).to eq(1)
      expect(User.first.email).to eq(user.email)
      expect(current_path).to eq(root_path)
    end
  end
end
