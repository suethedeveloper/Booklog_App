require "rails_helper"

RSpec.feature "Following Friends" do 
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Brown", email: "sarah@example.com", password: "password")    
    login_as(@john)
  end

  scenario "if signed in succeeds" do
    visit "/"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    # should not see john link since a user logged as @john
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@john.id}")

    # john click to follow sarah
    link = "a[href='/friendships?friend_id=#{@sarah.id}']"
    find(link).click

    # should not see sarah link since john already follows sarah
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@sarah.id}")
  end
end