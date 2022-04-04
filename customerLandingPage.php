<!DOCTYPE html>
<html>

<head>



    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Order your Pizza</title>
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
  
</div>

<br><br>	

<div class="container">
        <div class="col-md-12">
            <h2 style="text-align: center">Please Make your own Pizza</h2>
        </div>

<?php 
//include_once 'bakerLandingPage.php';
require_once './conn.php';

$cart = [];
$result = null;
$pizza_size = '';
$ingredients = '';
$pizza_price = '';
$pizza_name = '';
$total_ing_price = 0;
$total_order_price = 0;
$cus_id = null;
$customer_name = '';
$address = '';
$phone = '';

$sql = "SELECT * FROM show_all_pizza()";
$pizza_list = pg_query($db, $sql);

$sql = "SELECT * FROM fetch_all_ingredient_detail()";
$ingredient_list = pg_query($db, $sql);

$json = json_decode(file_get_contents('cart.json'), true);

if(!empty($json)) { 
    $cart = $json;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['submit'])) {
        $pizza_id = $_POST['pizza_id'];
        $p_size = $_POST['pizza_size' . $pizza_id];
        $p_price = $_POST['pizza_price' . $pizza_id];
		$pizza_name = $_POST['pizza_name'.$pizza_id];

        $cart_item = array("pizza" => $p_size, "price" => $p_price, "name" => $pizza_name);
        $cart[] = $cart_item;
        file_put_contents('cart.json', json_encode($cart));
    }

    if (isset($_POST['add_ingredient'])) {
        foreach ($_POST['ing_id'] as $ing_id) {
            $ing_name = $_POST['ing_name' . $ing_id];
            $ing_province = $_POST['ing_province' . $ing_id];
            $ing_price = $_POST['ing_price' . $ing_id];

            $cart_item = array("id" => $ing_id, "ing" => $ing_name . ' (' . $ing_province . ')', "price" => $ing_price);
            array_push($cart, $cart_item);
            file_put_contents('cart.json', json_encode($cart));
        }
    }

    if (isset($_POST['order'])) {
		
		$customer_name = $_POST['customer_name'];
		$address = $_POST['address'];
		$phone = $_POST['phone'];
		
		
		
        foreach ($cart as $item) {
            if (!empty($item['pizza'])) {
                $pizza_size = $item['pizza'];
                $pizza_price = $item['price'];
				//$pizza_name = $_POST['pizza_name'];
            }
            if (!empty($item['ing'])) {
                if ($ingredients != '') $ingredients .= ', ';
                $ingredients .= $item['ing'];
                $total_ing_price += $item['price'];

                $ing_id = $item['id'];
                $sql = "SELECT update_ingredient_quantity($ing_id)";
                $result = pg_query($db, $sql);
            }
        }
        $total_order_price = (int)$pizza_price + $total_ing_price;
		//$sql = "SELECT add_new_pizza('$pizza_name','$pizza_size', '$pizza_price')";
		
		$sql1 = "SELECT add_new_customer('$customer_name','$address','$phone')";
		
        $result1 = pg_query($db, $sql1);
		

        $sql = "SELECT add_order($pizza_size, '$ingredients', $pizza_price, $total_ing_price, $total_order_price)";
        $result = pg_query($db, $sql);

        $cart = [];
        file_put_contents('cart.json', json_encode($cart));
    }
}
?>





    <div class="container">
        <div class="row">
            <div class="col-md-6">
			<div class="col-md-6">
			
			<h5>Please Select Base pizza from our own pizza menu</h5>
			
			</div>
			
                <form method="POST" style="margin-bottom: 20px;">
                    <table class="table table-striped">
                        <thead>
                            <th></th>
                            <th>Pizza Size</th>
                            <th>Price</th>
							<th>Pizza Name</th>
                        </thead>
                        <tbody>
                        <?php
                        while($row = pg_fetch_assoc($pizza_list)){ ?>
                            <tr>
                                <td><input type="checkbox" class="chk" value="<?php echo $row['id']; ?>" name="pizza_id"></td>
                                <td><input type="hidden" name="<?php echo 'pizza_size'.$row['id']; ?>" value="<?php echo $row['size']; ?>"><?php echo $row['size']; ?></td>
                                <td><input type="hidden" name="<?php echo 'pizza_price'.$row['id']; ?>" value="<?php echo $row['price']; ?>"><?php echo $row['price']; ?></td>
								<td><input type="hidden" name="<?php echo 'pizza_name'.$row['id']; ?>" value="<?php echo $row['pizza_name']; ?>"><?php echo $row['pizza_name']; ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                    <br>
					
			
						<input type="submit" name="submit" value="Submit" onclick="getdata()">
			
					
					<br><br><br><br><br>
					
					
                    <div class="col-md-6">
					
					
			
						<h5>Please Select Extra Add ons for custom pizza </h5>
			
					</div>

                    <table class="table table-striped">
                        <thead>
                            <th></th>
                            <th>Add Extra Toppings </th>
                            <th>Province</th>
                            <th>Price</th>
                        </thead>
                        <tbody>
                            <?php
                            while($row = pg_fetch_assoc($ingredient_list)){ ?>
                            <tr>
                                <td><input type="checkbox" value="<?php echo $row['ing_detail_id']; ?>" name="ing_id[]"></td>
                                <td><input type="hidden" name="<?php echo 'ing_name'.$row['ing_detail_id']; ?>" value="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></td>
                                <td><input type="hidden" name="<?php echo 'ing_province'.$row['ing_detail_id']; ?>" value="<?php echo $row['province']; ?>"><?php echo $row['province']; ?></td>
                                <td><input type="hidden" name="<?php echo 'ing_price'.$row['ing_detail_id']; ?>" value="<?php echo $row['price']; ?>"><?php echo $row['price']; ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                    <input type="submit" name="add_ingredient" value="Add to list">
                </form>
            </div>
            <!-- order list will appear from here -->
            <div class="col-md-6>
                
                <div id="order-show-table">
                    <form method="POST">
                        <table class="table table-striped">
                            <thead>
                                <th>#</th>
                                <th>Item</th>
                                <th>Price</th>
                            </thead>
                            <tbody>
                                <?php
                                $t_price = 0;
                                $count = 1;
                                foreach ($cart as $row) { ?>
                                    <tr>
                                        <td><?php echo $count; ?></td>
                                        <td>
                                            <?php
                                            if (!empty($row['pizza'])) {
                                                echo $row['pizza'] . ' cm pizza';
                                            } else {
                                                echo 'Ing. ' . $row['ing'];
                                            }
                                            ?>
                                        </td>
                                        <td><?php $t_price += $row['price']; echo $row['price']; ?></td>
                                    </tr>
                                <?php $count++;
                                } ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2">Total Price</td>
                                    <td><?php echo $t_price; ?></td>
                                </tr>

				<br><br>
				<tr>
				

                                    <td colspan="2">Customer Name:</td>
                                    <td>
					<input type="text" id="custome_rname" name="customer_name">
				    </td>
                                </tr>
				<tr>
                                    <td colspan="2">Adress :</td>
                                    <td>
					<input type="text" id="address" name="address">
				    </td>
                                </tr>
				<tr>
                                    <td colspan="2">Contact No. :</td>
                                    <td>
					<input type="text" id="phone" name="phone">
				    </td>
                                </tr>

                            </tfoot>

			   

                        </table>
                        <input type="submit" name="order" style="float: right;" value="Place Order">
                        <br></br>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
        $('input.chk').on('change', function () {
            $('input.chk').not(this).prop('checked', false);
        });
        
    </script>
</div>
</body>

</html>