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
		<div class = "container">
			<div class = "col m6 offset-m3"></div>
				<div class = "card'">
					<div class = "card-content"></div>				
						<h3>Register here !!</h3>
						<!--create a form  -->
						
					<div class = "form center-align">
						<form action="Register" method = "post">
							<input type = "text" name = "user_name" placeholder="Enter username"/>
							<input type = "password" name = "user_password" placeholder="Enter password"/>
							<input type = "email" name = "user_email" placeholder="Enter email"/>
							
							<button type ="submit" class ="btn #8e24aa purple darken-1">Submit</button>
						
						</form>
					</div>
				
				</div>
		</div>


	</body>
</html>