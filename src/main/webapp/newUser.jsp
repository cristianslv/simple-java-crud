<!DOCTYPE html5>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
</head>
<body>
	<%@ page import="com.crud.bean.User, com.crud.dao.UserDAO,java.util.*" %>
	
	<form action="createUser.jsp" method="POST">		
		<label>Name:</label>
		<input type="text" name="nome">
		<br>
		
		<label>Password:</label>
		<input type="password" name="password">	
		<br>
		
		<label>Email:</label>
		<input type="text" name="email">	
		<br>
		
		<label>Sex:</label>
		<input type="radio" name="sexo" value="male" checked="checked">Male	
		<input type="radio" name="sexo" value="female">Female
		<input type="radio" name="sexo" value="none">Prefer not to answer			
		<br>
	
		<label>Country:</label>
		<select name="pais">
			<option value="brazil">Brazil</option>
			<option value="argentina">Argentina</option>
			<option value="france">France</option>
			<option value="germany">Germany</option>
			<option value="other">Other</option>
		</select>	
		<br>
			
		<button type="submit">Submit</button>
	</form>
</body>
</html>