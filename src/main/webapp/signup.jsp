<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
</head>
	<body style = "background: url(img/Bits.jpg); background-size: cover; background-attachment:fixed;">
		<div class = "container" style="background: white">
			<div class = "col m6 offset-m3"></div>
				<div class = "card'">
					<div class = "card-content"></div>				
						<h3>Register here !!</h3>
						<!--create a form  -->
						<h5 id = "msg"></h5>
					<div class = "form center-align">
						<form action="Register" method = "post" id = "myform">
							<input type = "text" name = "user_name" placeholder="Enter username"/>
							<input type = "password" name = "user_password" placeholder="Enter password"/>
							<input type = "email" name = "user_email" placeholder="Enter email"/>
							<button type ="submit" class ="btn #8e24aa purple darken-1" style="margin-top:20px">Submit</button>
						</form>
					</div>
					<div class="loader center-align" style="margin-top:10px; display:none">
						<div class="progress" >
    				  		<div class="indeterminate"></div>
  						</div>
  						<h5>Please wait..</h5>
					</div>
				</div>
		</div>
		
		<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
  		<script>
				$("#myform").on('submit', function(event){
					event.preventDefault();
					
					var f = $(this).serialize();
					
					console.log(f);
					$(".loader").show();
					$(".form").hide();
					
					$.ajax({
						url:"Register",
						data: f,
						type:"POST",
						success: function(data, textStatus, jqXHR){
							$(".loader").hide();
							console.log(data);
							if(data.trim() === 'Done'){
								$("#msg").html("Successfully Registered!!");
								$("#msg").addClass('green-text');
								
							}
							else{
								$("#msg").html("Error. Please try again!!");
								$("#msg").addClass('red-text');
							}
							
						},
						error: function(jqXHR, textStatus, errorThrown){
							console.log(data);
							console.log(error);
							
						}
						
					
					})
				})
		
		
		</script>
  
	</body>
</html>