require 'rails_helper'

RSpec.describe "As a guest" do
  context "When I visit /login" do
    it "I can log out" do
      user = User.create(email: 'test@example.com', password_digest: BCrypt::Password.create("test"))
      visit login_path

      fill_in :email, with: user.email
      fill_in :password, with: "test"
      click_on "Log In"

      click_on "Log out"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Log In or Sign Up")
      expect(page).to have_content("Logged Out Successfully")
    end
  end
end
