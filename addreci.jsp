<html lang="en">
<head>
  <title>Add Record</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  


</head>
<body style="background-color: #339a7b;">

<header>
<div class="navbar">
<ul>

<li><a href="viewrecipe.jsp"><i class="fa fa-newspaper-o" aria-hidden="true"></i>FEED</a></li>
<li><a href="viewrecipe.jsp"><i class="fa fa-search" aria-hidden="true"></i>SEARCH</a></li>
<li><a href="addreci.jsp"><i class="fa fa-glass" aria-hidden="true"></i>ADD RECIPE</a></li>
<li><a href="favorite.jsp"><i class="fa fa-heart-o" aria-hidden="true"></i>FAVORITES</a></li>
<li><a href="grocery.jsp"><i class="fa fa-shopping-basket" aria-hidden="true"></i>GROCERY LIST</a></li>
<li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a></li>

</ul>
</div>
</header>
<section ><br><br>
    <div class="container" style="background-color: rgba(44,62,80,0.7);width:70%;height:540px;">
        <div class="row">
           
            <div class="col-md-12">
                <h1 style="color: white">Add New Record</h1>
               <form name='f1' method='post' action="addreci_code.jsp" enctype="multipart/form-data">
   
					
	
<div class='row'>
	<div class='col-md-12'>
		<label for='dish'>dish:</label>
		<input type='text' class='form-control' id='dish' placeholder='Enter dish' name='dish' required >
	</div>
</div>
<div class='row'>
	<div class='col-md-12'>
		<label for='cuisine'>cuisine:</label>
		<select class='form-control' id='cuisine' name='cuisine' required >
		<option>North Indian</option>
		<option>Continental</option>
		<option>South Indian</option>
		<option>Punjabi</option>
		</select>
	</div>
</div>
<div class='row'>
	<div class='col-md-12'>
		<label for='ingredients'>ingredients:</label>
		<input type='text' class='form-control' id='ingredients' placeholder='Enter ingredients' name='ingredients' required >
	</div>
</div>
<div class='row'>
	<div class='col-md-12'>
		<label for='steps'>steps:</label>
		<textarea rows='3' class='form-control' id='steps' placeholder='steps' name='steps' required ></textarea>
	</div>
</div>
<div class='row'>
	<div class='col-md-12'>
		<label for='time'>time:</label>
		<input type='text' class='form-control' id='time' placeholder='Enter time' name='time' required >
	</div>
</div>
<div class='row'>
	<div class='col-md-12'>
		<label for='img'>img:</label>
		<input type='file' class='form-control' id='img' placeholder='Enter img' name='img' required >
	</div>
</div>
					
                 
					<div class='col-md-12'>
					  <br>
					   <input type="submit" name="submit" class="submit" value="Add"><br><br>
					</div>
                    </div>
                </form>
            </div>
        </div>
    
</section>
		
</body>
</html>
