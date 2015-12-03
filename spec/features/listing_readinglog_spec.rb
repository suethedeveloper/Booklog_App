require "rails_helper"

RSpec.feature "Listing Reading Logs" do 
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)

    @log1 = @john.readings.create(title: "Jane Eyre", author: "Charlotte Bronte", reading_date: "2015-12-01", duration_in_min: 60, note: "Awesome!")
    @log2 = @john.readings.create(title: "Of Mice and Men", author: "John Steinbeck", reading_date: "2015-11-30", duration_in_min: 200, note: "Great book!")
  end

  scenario "shows user's reading for last 7 days" do 
    visit "/"

    click_link "My Lounge"

    expect(page).to have_content(@log1.title)
    expect(page).to have_content(@log1.author)
    expect(page).to have_content(@log1.reading_date)
    expect(page).to have_content(@log1.duration_in_min)
    expect(page).to have_content(@log1.note)

    expect(page).to have_content(@log2.title)
    expect(page).to have_content(@log2.author)
    expect(page).to have_content(@log2.reading_date)
    expect(page).to have_content(@log2.duration_in_min)
    expect(page).to have_content(@log2.note)
  end
end
