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

    fill_in "Book Title", with: "Harry Potter"
    fill_in "Author", with: "J. K. Rowling"
     fill_in "Reading Date", with: Date.today
    fill_in "Duration", with: 20
    click_button "Create Reading Log"

    expect(page).to have_content("Reading log has been created")

    readingLog = Reading.last
    expect(page.current_path).to eq(user_reading_path(@john, readingLog))    
  end

  scenario "with invalid inputs" do
    visit "/"

    click_link "My Lounge"
    click_link "New Reading Log"
    expect(page).to have_link("Back")
    
    fill_in "Book Title", with: ""
    fill_in "Author", with: ""    
    fill_in "Reading Date", with: ""
    fill_in "Duration (min)", with: nil
    click_button "Create Reading Log"

    expect(page).to have_content("Reading Log has not been created")

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Author can't be blank")
    expect(page).to have_content("Author can't be blank")
    expect(page).to have_content("Reading Date can't be blank")
    expect(page).to have_content("Duration in min can't be blank")
    expect(page).to have_content("Duration in min is not a number")  
   
  end  
  
end





