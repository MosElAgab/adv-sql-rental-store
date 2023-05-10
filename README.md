# adv-sql-rental-store
---

Video streaming services are all well and good, but they lack a certain physical quality. Not to miss out on a questionable business venture, Northcoders is bringing back the **video rental store**!

Business is somewhat slow at the moment (surprisingly!) so we've been tasked to start thinking about how we store our data. At the moment we have the following three tables:

-   stores

-   customers

-   movies

-   stock

# Section One

## Task 1

1. Query the database to retrieve all of the movie titles that were released in the 21st century.

2. Query the database to find the oldest customer.

3. Query the database to find the customers who's name begin with the letter _D_. Organise the results by age, youngest to oldest.

4. Query the database to find the average rating of the movies released in the 1980s. **If there are any `null` ratings you should treat them as a 0 rating**

5. The rise in living costs is affecting rentals, drop the cost of all rentals by 5% and display the updated table. **As this is a monetary value make sure it is rounded to 2 decimal places**

> _**If you want to run the updates multiple times without going bankrupt, the data will need to be reset. We've added a bash script that will run all of the *.sql files in the ./db folder. Try running the command `./run-all.sh` from your terminal in the root of this repository. This will save the output of each *.sql file in the ./db directory to a \*.txt file of the same name.**_
