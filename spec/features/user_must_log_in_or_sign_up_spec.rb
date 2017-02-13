require 'rails_helper'

RSpec.describe "As a guest" do
 context "When I visit /" do
   it "I am forced to sign up or log in" do
     visit root_path

     expect(page).to have_content("Log In or Sign Up")
   end
 end
end
