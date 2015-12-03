#Booklog App

### This app is made with:
* Ruby version : ruby 2.0.0p481

* Rails version: ails 4.2.4

* Database: PostgreSQL


----------

### Set up RSpec

1. Create without default testing framework

2. Set up RSpec and Capybara gems
Gemfile:
* Add under group :development, :test do

	   gem 'rspec-rails', '3.2.3'

* Add the following at the end of the file

	   group :test do
	     gem 'capybara', '2.4.4'
	   end

3. run

        bundle install
4. run

        rails generate rspec:install

5. Create a testing file under spec

	 ```mkdir spec/features```

	 ```touch spec/features/creating_article_spec.rspec```

6. run

    ```rspec spec/features/creating_homepage_spec.rspec.rb```

----------

### Set up Guard (https://github.com/guard/guard-rspec)
```Gemfile``` - under ```group :development, :test do```

      gem 'guard-rspec', require: fale
      gem 'spring-commands-rspe'
      
run

        bundle install
    
run (this will create a new guard file)

        guard init rspec

open ```Guardfile``` from a root directory and change:
Original

      guard :rspec, cmd: "bundle exec rspec" do

Change To

      guard :rspec, cmd: "rspec" do

run to start the guard

      guard

------

#### Add Bootstrap
* Gemfile

  ```gem 'bootstrap-sass', '~>3.3.4.1'```

  ```gem 'autoprefixer-rails', '~>5.2.0'```

  ```bundle install``` 

* Create ```custom.css.scss``` under stylesheet directory

  ```@import "bootstrap-sprockets";```

  ```@import "bootstrap";```

  * ```application.js``` under javascript directory
  
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


#### Installing CHART
 
##### Morris.js


http://morrisjs.github.io/morris.js/

Right click on Download button and select 'Copy Link Address'

On Terminial, run:

```wget https://github.com/morrisjs/morris.js/archive/0.5.1.zip```

```unzip 0.5.1.zip```

```mv morris.js-0.5.1/morris.js vendor/assets/javascripts/```

##### Raphael JavaScript Library

http://raphaeljs.com/

Right click on Download button and select 'Copy Link Address'

wget http://github.com/DmitryBaranovskiy/raphael/raw/master/raphael-min.js

mv raphael-min.js vendor/assets/javascripts


#### Add first & last name to User
* Create a new controller
```touch app/controllers/registrations_controller.rb```

* Add the on ```registrations_controller.rb```
  

	     class RegistrationsController < Devise::RegistrationsController
	     private
	      
	      def sign_up_params
	        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	      end
	
	      def account_update_params
	        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
	      end
	     end
      

* Modify ```routes.rb```

  ```devise_for :users, :controllers => {registrations: 'registrations'}```