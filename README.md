#Booklog App

### This app is made with:
Ruby version : ruby 2.0.0p481

Rails version: ails 4.2.4

Database: PostgreSQL


----------

### Set up RSpec

1. Create without default testing framework

2. Set up RSpec and Capybara gems

		Gemfile:
		* Add under group :development, :test do
		```ruby
		    gem 'rspec-rails', '3.2.3'
		```
		* Add the following at the end of the file:
		```ruby	
		    group :test do
		      gem 'capybara', '2.4.4'
		    end
		```		

3. run:
    ```bundle install```
4. run:
    rails generate rspec:install
5. Create a testing file under spec:

	 ```mkdir spec/features```
	 ```touch spec/features/creating_article_spec.rspec```

6. run:
    ```ruby 
    rspec spec/features/creating_article_spec.rspec.rb
    ```
----------

### Set up Guard (https://github.com/guard/guard-rspec)
1. Gemfile: 
	* under group :development, :test do -> ad
		  ```ruy
		  gem 'guard-rspec', require: fale
		  gem 'spring-commands-rspe'
		  ``
2. run:

    ```bundle install```
    
3. run (this will create a new guard file):
    ```guard init rspec```
4. open Guardfile from a root directory and change:
    Original
    ```ruby
    guard :rspec, cmd: "bundle exec rspec" do
    ```
    Change To
    ```ruby
    guard :rspec, cmd: "rspec" do
    ```
5. run to start the guard:
    ```guard```

------

#### Add Bootstrap
  * Gemfile
```gem 'bootstrap-sass', '~>3.3.4.1'```
```gem 'autoprefixer-rails', '~>5.2.0' ```

bunle install

  * Create custom.css.scss under stylesheet directory
  ```@import "bootstrap-sprockets";```
  ```@import "bootstrap";```

  * application.js under javascript directory
  ```//= require bootstrap-sprockets```

#### Add Devise 
  * Gemfile
  ```gem 'devise'```

  * command line
  ```bundle install```
  ```rails generate devise:install```
  ```rails generate devise user```
  ```rake db:migrate```
