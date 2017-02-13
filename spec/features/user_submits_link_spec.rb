require 'rails_helper'

RSpec.describe "As a user" do
 context "When I visit /" do
   it "I can create a link" do
     link = create(:link)
     visit root_path

     fill_in :title, with: link.title
     fill_in :title, with: link.url
     click_on "Create Link"

     expect(current_path).to eq(links_path)
     expect(page).to have_content("Successfully created #{link.title}")
     expect(page).to have_content(link.url)
     expect(page).to have_content("false")
   end
 end
end
