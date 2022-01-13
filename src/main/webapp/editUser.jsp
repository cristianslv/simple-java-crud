<!DOCTYPE html5>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>
</head>
<body>
	<%@ page import="com.crud.bean.User, com.crud.dao.UserDAO,java.util.*" %>
	
	<%
		String id = request.getParameter("id");
	
		User user = UserDAO.getById(Integer.parseInt(id));
	%>
	
	<h1>Edit User</h1>
	
	<form action="updateUser.jsp" method="POST">
		<input type="hidden" name="id" value="<%= user.getId() %>">
		
		<label>Name:</label>
		<input type="text" name="nome" value="<%= user.getNome() %>">
		<br>
		
		<label>Password:</label>
		<input type="password" name="password" value="<%= user.getPassword() %>">	
		<br>
		
		<label>Email:</label>
		<input type="text" name="email" value="<%= user.getEmail() %>">	
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