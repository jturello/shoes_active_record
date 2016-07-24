Epicodus Ruby Week 4 Individual Coding Assignment for Code Review:  
DB with ActiveRecord/Sinatra & many to many relationships.

By James Turello

## Description (Assignment)

> Write a program to track shoe brands and what stores they are in. Here are the user stories:

> As a user, I want to be able to add, update, delete and list shoe stores.
> As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
> As a user, I want to be able to add shoe brands to a store to show where they are sold.
> As a user, I want to be able to see all of the brands a store sells on the individual store page.
> As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
> As a user, I do not want stores and shoes to be saved if I enter a blank name.


## Setup/Installation Requirements

* Clone this git repository (shoes_active_record).
* In a terminal window cd into the project's root directory and
 * run the `bundle` command
 * run `rake db:migrate`
 * run `rake db:test:prepare` (if you want to run tests)
* Still from the root directory in a terminal window
  * run command `pg_ctl start` (to star the postrgres database server)
* In another terminal window form the root directory
  * run command: `ruby app.rb`
* Enter `localhost:4567` in your browser


## Known Bugs

As currently implemented shoe brands cannot be deleted from the user interface as this was not a requirement for the assignment.

## Technologies Used

Coded and tested on Chrome 51 on a Mac Book Pro running ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15], Bootstrap v3.3.6, and Sinatra 1.4.7

### License

This software is available for use under the MIT license.

Copyright (c) 2016 - James Turello
