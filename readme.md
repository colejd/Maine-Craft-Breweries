# Maine Craft Breweries
> Jonathan Cole <br /> Spring 2017

This my implementation of the final project for SIE557 
at the University of Maine. 

## Introduction

#### Structure

All client-facing pages are rendered from PHP by the server. 
The client-side pages use a lot of JS for the forms; in 
particular, I made heavy of use of Bootstrap.

The pages talk to the server through AJAX requests to a
dedicated API on the server. This API is written in pure
PHP for querying and altering the data in the database.

All client-facing pages may be found in [`/page/`]("/page/"). 
All other PHP can be found in [`/php/`]("/php/"); in 
particular, you can find the API in [`/php/api/`]("/php/api").

When choosing what to edit or add or search by, various partial
pages are loaded into the window. You may find these files
in the [`/partials/`]("/partials/") directory.


#### API

The benefit of the API is that you don't need my frontend to
query or alter data. For example, try going to 
[http://localhost:8888/mcb/php/api/search.php?type=name&term=beer](http://localhost:8888/mcb/php/api/search.php?type=name&term=beer)
to get all the breweries with "beer" in the name, as well as
the beers that they serve. I thought this would keep things
nice and compartmentalized.


## Installation

This website is designed to run on a MAMP server. Put the root
directory in your `htdocs` directory, and make sure you have
a user called `sie557` with a password of `sie_557_password`.
You should change these should you wish to put this into
production.

You'll want to import [`/sql/MCB.sql`]("/sql/MCB.sql"). This
will create the database and populate it with my test data.

To get started, visit [http://localhost:8888/mcb/page/index.php](http://localhost:8888/mcb/page/index.php).


## Attribution

This project shares a small amount of code from another project
I am working on for SIE510. You can find that project [here](https://github.com/sixtycycles/airwhale).