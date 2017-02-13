require 'rails_helper'

RSpec.describe "As a guest" do
  context "When I visit /users/new" do
    it "I can create an account" do
      user = User.create(email: 'test@example.com', password_digest: BCrypt::Password.create("test"))
      visit login_path

      fill_in :email, with: user.email
      fill_in :password, with: "test"
      click_on "Log In"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Logged in as #{user.email}")
      expect(page).to have_content("Log out")
    end
  end
end
