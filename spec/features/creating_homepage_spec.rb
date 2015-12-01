require 'rails_helper'

RSpec.feature "Creating Home Page" do

    scenario do
        visit "/"
        expect(page).to have_link("Bookworm Brady")
        expect(page).to have_link("Home")
        expect(page).to have_content("Book Reading Lounge")
    end
    
end