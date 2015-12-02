require "rails_helper"

RSpec.feature "Creating Reading Log" do
  before do 
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario "with valid inputs" do
    visit "/"

    click_link "My Lounge"

    click_link "New Reading Log"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 20
    fill_in "Title", with: "Harry Potter"
    fill_in "Author", with: "J. K. Rowling"
    click_button "Create Reading Log"

    expect(page).to have_content("Reading log has been created")

    readingLog = Reading.last
    expect(page.current_path).to eq(user_reading_path(@john, readingLog))    
  end
  
end