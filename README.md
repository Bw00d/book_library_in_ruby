#Book Library in Ruby and Postgres
##Epicodus bootcamp exercise

####This is an exercise to practice join tables in a postgres database. We worked off user stories

* As a librarian, I want to create, read, update, delete, and lists books in the catalog, so that we can keep track of our inventory.
* As a librarian, I want to search for a book by author or title, so that I can find a book when there are a lot of books in the library.
* As a librarian, I want to enter multiple authors for a book, so that I can include accurate information in my catalog. (Hint: make an authors table and a books table with a many-to-many relationship.)
* As a patron, I want to know how many copies of a book are on the shelf, so that I can see if any are available. (Hint: make a copies table; a book should have many copies.)
* As a patron, I want to see a history of all the books I checked out, so that I can look up the name of that awesome sci-fi novel I read three years ago. (Hint: make a checkouts table that is a join table between patrons and copies.)
* As a patron, I want to know when a book I checked out is due, so that I know when to return it.
* As a librarian, I want to see a list of overdue books, so that I can call up the patron who checked them out and tell them to bring them back - OR ELSE!
