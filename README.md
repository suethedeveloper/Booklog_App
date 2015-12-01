#Booklog App

### This app is made with:
Ruby version : ruby 2.0.0p481

Rails version: ails 4.2.4

Database: PostgreSQL


- Create without default testing framework
- Set up RSpec and Capybara gems

Gemfile:
* Add under group :development, :test do
    gem 'rspec-rails', '3.2.3'
* Add the following at the end of the file:
    group :test do
      gem 'capybara', '2.4.4'
    end

* run:
    bundle install
* run:
    rails generate rspec:install
* Create a testing file under spec:
    touch spec/features/creating_article_spec.rspec.rb

* Here is creating_article_spec.rspec.rb file:
  require 'rails_helper'
  RSpec.feature "Creating Articles" do
    scenario "A user creates a new article" do
      visit "/"

      click_link "New Article"

      fill_in "Title", with: "Creating first article"
      fill_in "Body", with: "Lorem Ipsum"
      click_button "Create Article"

      expect(page).to have_content("Article has been created")
      expect(page.current_path).to eq(articles_path)
    end
  end

* run:
    rspec spec/features/creating_article_spec.rspec.rb

### Install Guard (https://github.com/guard/guard-rspec)
Gemfile:
* Add under group :development, :test do
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'

* run:
    bundle install
* run (this will create a new guard file):
    guard init rspec
* open Guardfile from a root directory and change:
    Original
    guard :rspec, cmd: "bundle exec rspec" do
    Change To
    guard :rspec, cmd: "rspec" do
* run to start the guard:
    guard 