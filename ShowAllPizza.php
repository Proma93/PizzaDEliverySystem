<?php require_once 'conn.php'?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Pizza Page</title>
</head>

<body>
	<div>
        <?php include_once 'bakerLandingPage.php'?>
    </div>

    <div class="container">
        	 
		<div class="col-md-12">
		
            <h2 style="text-align: center">Pizza Fun Menu</h2>
		
        </div>
		<div class="col-md-12">
				<h2><a href="pizzaManagement.php">Add New Pizza</a></h2>
		
        </div>
	
        <div style="height:auto; width:100%; border: 1px solid black; float: left">
            <div class="col-md-12"><u>
                    <h3>Pizza Details</h3>
                </u></div>
            <?php

echo '<table class="table table-striped">
      <tr>
        <th> <font face="Arial">Id</font> </th>
		<th> <font face="Arial">Pizza Name</font> </th>
          <th> <font face="Arial">Size</font> </th>
          <th> <font face="Arial">Price</font> </th>
      </tr>';

$sql = "select * from show_all_pizza()";
$result = pg_query($db, $sql);

while ($row = pg_fetch_assoc($result)) {
    ?>
            <form method="post">
                <tr>
                    <td><?php echo $row["id"]; ?></td>
					<td><?php echo $row["pizza_name"]; ?></td>
                    <td><?php echo $row["size"]; ?></td>
                    <td><?php echo $row["price"]; ?></td>
                </tr>
            </form>
            <?php }?>

            </table>

        </div>
    </div>

    <script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
    </script>

</body>

</html>