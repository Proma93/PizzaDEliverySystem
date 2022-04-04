<!DOCTYPE html>
<html lang="en">
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
  background-color: #6C6E6D ;
  padding: 20px;
  text-align: center;
  font-size: 35px;
  color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 15%;
  height: 500px; /* only for demonstration, should be removed */
  background: #ccc;
  padding: 20px;
}

/* Style the list inside the menu */
nav ul {
  list-style-type:;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 85%;
  background-color: #f1f1f1;
  height: 500px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section::after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
  background-color: #777;
  padding: 10px;
  text-align: center;
  color: white;
 
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
</style>
</head>
<body>

<header>
  <h2><a href="index.php">Pizza Fun</a></h2>
</header>

<section>
  <nav>
    <ul>
      <li><a href="bakerLandingPage.php">Baker</a></li>
      <li><a href="customerLandingPage.php">Customer</a></li>
    </ul>
  </nav>
  
  <article>
   <h1>Welcome to PIZZA FUN</h1>
   <p>Please Select Baker if you want to manage Pizza Fun Shop</p>
   <p>Please Select Customer if you want to Order pizza from Pizza Fun Shop</p>
   <p></p>
  </article>
</section>

<footer>
  <p><a href="contact.php">Contact Us</a></p>
</footer>

</body>
</html>
