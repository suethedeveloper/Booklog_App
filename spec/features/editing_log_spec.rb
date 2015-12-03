require "rails_helper"

RSpec.feature "Editing Reading Log" do

  before do
    @owner = User.create(email: "owner@example.com", password: "password")

    @owner_log = @owner.readings.create!(title: "The Book Thief", 
                  author: "Markus Zusak", reading_date: "2015-12-01", duration_in_min: 45)
    login_as(@owner)
  end
  
  scenario "with valid inputs succeeds" do
    visit "/"
    
    click_link "My Lounge"
    link = "a[href='/users/#{@owner.id}/readings/#{@owner_log.id}/edit']"
    find(link).click
    fill_in "Duration", with: 50
    click_button "Update Reading"

    expect(page).to have_content("Reading Log has been updated")
    expect(page).to have_content(50)
    expect(page).not_to have_content(45)


  end
end