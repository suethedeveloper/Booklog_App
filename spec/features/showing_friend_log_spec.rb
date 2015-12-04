require "rails_helper"

RSpec.feature "Showing Friend Log" do 
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")

    @log1 = @john.readings.create(title: "Jane Eyre", author: "Charlotte Bronte", reading_date: Date.today, duration_in_min: 60, note: "Awesome!")
    @log2 = @john.readings.create(title: "Of Mice and Men", author: "John Steinbeck", reading_date: Date.today, duration_in_min: 200, note: "Great book!")

    login_as(@john)

    @following = Friendship.create(user: @john, friend: @sarah)
  end

  scenario "shows friend's reading log for last 7 days" do
    visit "/"
    click_link "My Lounge"
    click_link @sarah.full_name

    expect(page).to have_content(@sarah.full_name + "'s Reading Log")
    # expect(page).to have_content(@log2.reading_logs)
    expect(page).to have_css("div#chart")    
  end
end