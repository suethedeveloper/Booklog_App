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

		    gem 'rspec-rails', '3.2.3'

* Add the following at the end of the file:

		    group :test do
		      gem 'capybara', '2.4.4'
		    end

3. run:

        bundle install
4. run:

        rails generate rspec:install

5. Create a testing file under spec:

	 ```mkdir spec/features```

	 ```touch spec/features/creating_article_spec.rspec```

6. run:

    ```rspec spec/features/creating_homepage_spec.rspec.rb```

----------

### Set up Guard (https://github.com/guard/guard-rspec)
Gemfile: 
	* under group :development, :test do -> ad

      gem 'guard-rspec', require: fale

      gem 'spring-commands-rspe'
      
run:

        bundle install
    
run (this will create a new guard file):

        guard init rspec

open Guardfile from a root directory and change:
Original

      guard :rspec, cmd: "bundle exec rspec" do

Change To

      guard :rspec, cmd: "rspec" do

run to start the guard:

      guard

------

#### Add Bootstrap
* Gemfile

  ```gem 'bootstrap-sass', '~>3.3.4.1'```

  ```gem 'autoprefixer-rails', '~>5.2.0'```

  ```bundle install``` 

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


#### TESTING FEATURES 

Create feature specs to test under spec/features 

For example: 

        mkdir spec/features
        touch spec/features/creating_article_spec.rspec

run 

        guard


#### Note
1. login_as(@john) method 

2. open
```spec/rails_helper.rb```

3. Add the following under ```require 'rspec/rails'```
 
        include Warden::Test::Helpers
        Warden.test_mode!



-------------------

rails g controller readings
rails g model reading duration_in_min:integer reading_date:date user:references title author note:text
rake db:migrate
rails g migration add_name_to_users first_name last_name
rake db:migrate

  