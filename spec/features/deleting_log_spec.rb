require "rails_helper"
RSpec.feature "Deleting Reading Log" do
  before do
    @owner = User.create(first_name: "John", last_name: "Doe", email: "owner@example.com", password: "password")
    @owner_log = @owner.readings.create!(title: "The Book Thief", 
                  author: "Markus Zusak", reading_date: Date.today, duration_in_min: 48)
    login_as(@owner)
  end
 
  scenario do
    visit "/"

    click_link "My Lounge"
    link = "//a[contains(@href, '/users/#{@owner.id}/readings/#{@owner_log.id}') and .//text()='Delete']"
    find(:xpath, link).click

    expect(page).to have_content("Reading Log has been deleted")

  end
end 