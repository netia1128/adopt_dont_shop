# Adopt, don't Shop

## Background and Description
Adopt Dont Shop was a student project completed during my time at the Turing School of Software Design. The core of the project was to take an existing rails project and build on it to allow users to broswe pets available for adoption and submit adoption applications, and then to allow admins can review and approve those applications. The complete project requirements can be found [here](https://github.com/turingschool-examples/adopt_dont_shop). The completed project was deployed to Heroku [here](https://netia-adopt-dont-shop.herokuapp.com/pets).

## Technologies Used
PostgreSQL  
Bootstrap  
HTML5 & CSS3  
Ruby 2.7.2 & Rails 5.2.6

## Database Relational Map
<img width="921" alt="Screen Shot 2021-06-10 at 2 05 54 PM" src="https://user-images.githubusercontent.com/76889420/121590150-35b29a80-c9f5-11eb-91f1-48cee06b3441.png">

The project is built with a small Postgres database comprised of four inter-related tables, one of which is a joins table.

## Testing
The project uses Rspec and the suite of gems listed below to throughly test the project. Simplecov coverage is 100% for the project.  
* capybara  
* shoulda-matchers  
* launchy  
* orderly  
* rspec-rails  
* simplecov  

## Cloning the Project
To open this project, follow these steps:
1. Fork this repository
2. Clone your fork
3. From the command line, install gems
4. From the command line, create, migrate, and seed your database
