# adv-sql-rental-store
---

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
## Task 2

1. Create a `genres` table with the following data:

| genre_slug | description                                                    |
| ---------- | -------------------------------------------------------------- |
| family     | Fun for everyone!                                              |
| comedy     | A giggle a minute                                              |
| romance    | I feel it in my fingers, I feel it in my toes                  |
| fantasy    | There be elves and witches                                     |
| action     | Shooty shooty, punchy punchy                                   |
| drama      | Plot driven story time                                         |
| crime      | Watch out, there's gangsters about                             |
| sci_fi     | Your scientists were so preoccupied with whether they could... |

2. Movies can often be associated with more than one genre. Create a many to many relationship between the `genres` table and the `movies` using a junction table.

3. Insert some data about the film genres. Feel free to use the information in the table below:

| Film                               | Genres               |
| ---------------------------------- | -------------------- |
| Ghostbusters II                    | Family, Comedy       |
| The Breakfast Club                 | Comedy, Drama        |
| Todo Sobre Mi Madre                | Comedy, Drama        |
| The Lion King II: Simba''s Pride   | Family               |
| The Care Bears Movie               | Family               |
| Tron                               | Fantasy, Action      |
| Highlander                         | Fantasy, Action      |
| Cleopatra                          | Romance, Drama       |
| Catch Me If You Can                | Comedy, Drama, Crime |
| Taxi Driver                        | Drama, Crime         |
| The Princess Switch                | Comedy, Romance      |
| Girl, Interrupted                  | Drama                |
| The Fellowship of the Ring         | Fantasy, Action      |
| Episode I - The Phantom Menace     | Action, Sci-Fi       |
| Episode IV - A New Hope            | Action, Sci-Fi       |
| Episode IX - The Rise of Skywalker | Action, Sci-Fi       |
| Back to the Future                 | Comedy, Sci-Fi       |
| Back to the Future Part II         | Comedy, Sci-Fi       |
| The Godfather                      | Drama, Crime         |
| Raiders of the Lost Ark            | Action, Fantasy      |
| Pulp Fiction                       | Crime                |
| Toy Story                          | Family               |
| Groundhog Day                      | Comedy, Romance      |
| A Fish Called Wanda                | Comedy, Crime        |
| Independence Day                   | Action, Sci-Fi       |

## Task 3

**If there are any `null` ratings you should treat them as a 0 rating!**

1. Query the database to find the number of films in stock for each genre.

2. Query the database to find the average rating for films in stock in Newcastle.

3. Query the database to retrieve all the films released in the 90s which have a rating greater than the total average.

4. Query the database to find the amount of films in stock, across **all** stores, of the top rated film of the five most recently released films.

5. Query the database to find a list of all the locations customers live in which **don't** contain a store.

6. Query the database to find a list of all the locations we have influence over (locations of stores and/or customers), **there should be no repeated data**.

7. Of the stores which exist in locations that have customers, calculate which store has the largest catalogue of stock. What is the most abundant genre in that store?

## Task 4

1. Query the database to find the store the highest total number of copies of sequels.

    > _Note: For now let's assume you can tell if a film is a sequel if the title contains something like 'II' or 'VI'._

2. This is likely not a good way to identify sequels going forward. Alter the movies table to track this information better and then update previous query to make use of this new structure.

## Task 5

1. Design a way of storing information on rentals. A rental should track the following information:

    - rental_id
    - stock_id
    - rental_start
    - rental_end
    - customer_id

    Add some rental rows we can query later.

2. Finally, we have a customer in one of our stores! They wish to rent a film but have some requirements:

-   The film must be age appropriate (classification of U)
-   The film must be available in Birmingham.
-   The film must not have been rented more than 5 times already

Instead of creating a list of only the films that match this criteria, create an output which marks `yes` or `no` in a column that represents the requirement. An example has been given below:

| title   | age_appropriate | in_stock_nearby | not_too_mainstream |
| ------- | --------------- | --------------- | ------------------ |
| x-men 2 | no              | yes             | yes                |

## Task 6

An Entity Relationship Diagram (ERD) is a good way to visualise the structure of a database and it's relationships. Use the following free software [dbdiagram.io](https://dbdiagram.io/home) to draw out the relationships between the different tables.
