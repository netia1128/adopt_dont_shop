# Adopt, don't Shop

## Background and Description
Adopt Dont Shop was a student project completed during my time at the Turing School of Software Design. The core of the project was to take an existing rails project and build on it to allow users to broswe pets available for adoption and submit adoption applications, and then to allow admins can review and approve those applications. The complete project requirements can be found [here](https://github.com/turingschool-examples/adopt_dont_shop).

## Technologies Used
Rails 5.2.6 with gems:  
* capybara  
* shoulda-matchers  
* launchy  
* orderly  
* rspec-rails  
* simplecov  
Ruby 2.7.2  
PostgreSQL  
Bootstrap  
HTML5  
CSS3  

## Database Relational Map
<img width="921" alt="Screen Shot 2021-06-10 at 2 05 54 PM" src="https://user-images.githubusercontent.com/76889420/121590150-35b29a80-c9f5-11eb-91f1-48cee06b3441.png">

The project is built with a small Postgres database comprised of four inter-related tables, one of which is a joins table.


Fork this repository
Clone your fork
From the command line, install gems and set up your DB:
bundle
`rake load_csv``
Run the test suite with bundle exec rspec.
Run your development server with rails s to see the app in action.
A Note on Using Existing Data
This project comes preloaded with customer, invoice, merchant, item and transaction data to pre-populate the application. The full data-set can be found in csv files under app/db/data. Additionally there is a collection of truncated data that is a lot easier to load and utilize that can be found at app/db/data/test_data. After running bundle install, either rake load_csv or rake load_test_csv should be run. The rake files will create the database, apply migrations and then load csv data into your database.

Testing
Our project fully utilizes the test database of the Rails application to streamline testing. From the command-line, run rake load_test_csv RAILS_ENV=test to populate the test database. Our project uses RSpec as the testing framework, and individual items from the database can be tested by finding them using methods like #first, #last or #find(). Example in a before each hook:

before :each do
  @customer = Customer.first
  @customer_invoice = @customer.invoices.first
  @invoice_transaction = @customer_invoice.transaction.first
end
Schema
As mentioned above this applications handles inter-related data across customers, invoices, merchants and their items. This web of relationships is captured by the database schema used below:



**Note**: Some small details like status columns have been changed to utilize enums for database efficiency. For the most up-to-date resource for this applications schema please see `db/schema.rb` after running your migrations.
