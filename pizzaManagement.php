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

    <?php
// post data to database
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	
	$pizza_name= $_POST['pizza_name'];
    $pizza_size = $_POST['pizza_size'];
    $pizza_price = $_POST['pizza_price'];
    $sql = "SELECT add_new_pizza('$pizza_name','$pizza_size', '$pizza_price')";
    $result = pg_query($db, $sql);
}

?>
    <div class="container">
        <div class="col-md-12">
            <h2 style="text-align: center">Pizza Management</h2>
        </div>
        <div style=" width:100%; border: 1px solid black; margin-bottom : 10px; float : left">

            <form style="float : left" action="pizzaManagement.php" method="post">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12" style="margin: 10px"><u>
                                <h3>Add New Pizza</h3>
                            </u></div>
                        <div class="col-md-12" style="margin: 10px">
							<div class="col-md-4">
                                <label for="pizza_name">Pizza Name</label>
                            </div>
							<div class="col-md-4">
                                <input type="text" class="form-control" id="pizza_name" name="pizza_name"
                                    placeholder="Enter Pizza Name">
                            </div>
                            
                        </div>
						 <div class="col-md-12" style="margin: 10px">
						<div class="col-md-4">
                                <label for="pizza_size">Pizza Size</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="pizza_size" name="pizza_size"
                                    placeholder="Enter Pizza Size">
                            </div>
                            <div class="col-md-4" style="padding-top: 7px">cm</div>
						</div>
						
						
                        <div class="col-md-12" style="margin: 10px">
							
                            <div class="col-md-4">
                                <label for="pizza_price">Pizza Price</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="pizza_price" name="pizza_price"
                                    placeholder="Enter Pizza Price">
                            </div>
                            <div class="col-md-4" style="padding-top: 7px">€</div>
                        </div>
                        <div class="col-md-12" style="margin: 10px; text-align: center">
                            <button style="margin-left: 40px;" type="submit" class="btn btn-primary"
                                name="submit">Submit</button>
                        </div>
                    </div>
                </div>


            </form>

        </div>

        <div style="height:auto; width:100%; border: 1px solid black; float: left">
            <div class="col-md-12"><u>
                    <h3><a href="ShowAllPizza.php">Show Pizza Menu</a></h3>
                </u></div>
            

        </div>
    </div>

    <script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
    </script>

</body>

</html>