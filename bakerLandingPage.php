<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {margin:0;}

.navbar {
  overflow: hidden;
  background-color: #333;
  position: fixed;
  top: 0;
  width: 100%;
}

.navbar a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.navbar a:hover {
  background: #ddd;
  color: black;
}

.main {
  padding: 16px;
  margin-top: 30px;
  height: auto; /* Used in this example to enable scrolling */
}
</style>
</head>
<body>

<div class="navbar">
	<a href="index.php">Pizza Fun</a>
  <a href="supplierManagement.php">Supplier Management</a>
  <a href="ingredientManagement.php">Ingredient Management</a>
  <a href="pizzaManagement.php">Pizza Management</a>
  <a href="orderManagement.php">Show Order List</a>
</div>

<div class="main">

</div>

</body>
</html>
