# Pizza_DElivery_System
Task Description:
Programming:
The program consists of

PostgreSQL-database with the program logic implemented in PL/pgSQL and
Frontend for interaction with the data from the database.
Database:
The database is provided by PostgreSQL.
Most of the program logic is implemented directly in the database using PL/pgSQL as main programming language.
All the pizza data (and related information) is stored in the database.
Frontend:
There are two different mutual exclusive views: pizza baker and customer
a) it can be switched easily between both and there is no need for complex user management
The pizza baker view includes options to:
a) list of all pizzas that were recently ordered
b) manage ingredients (add, change, hide/show, remove and restock)
  • restocking performs by ordering from different available suppliers (hidden suppliers are not available)
  • it takes place immediately (suppliers have no delivery time)
  • base pizzas in all their different sizes are available in an infinite number, so there is no need to restock
c) manage suppliers (add, change, hide/show and remove)
The customer view includes the options to:
a) list all available ingredients along with their name, regional provenance and price
  • ingredients that are hidden or run out of stock must not be shown
b) create a pizza composition by selecting a base pizza in a certain size and all available ingredients
c) order a pizza in accordance with the previously created composition
For demonstration purposes there are available at least:
a) 2 different recently ordered pizzas
b) 3 different base pizza sizes
c) 5 different suppliers with only partly overlapping assortment
d) 10 different ingredients with various regional provenances and prices, whereof at least
  i. 3 have only 1 regional provenance and price
  ii. 5 have at least 3 different regional provenances and prices
