<!DOCTYPE html5>
<html>
<head>
<meta charset="UTF-8">
<title>Users</title>
</head>
<body>
	<%@ page import="com.crud.dao.UserDAO, com.crud.bean.User, java.util.*" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<h1>Users list</h1>
	
	<%
	List<User> list = UserDAO.getAllUsers();
	request.setAttribute("list", list);
	%>
	
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Sex</th>
			<th>Country</th>
			<th colspan="2">Actions</th>
		</tr>
		
		<tbody>
			<c:forEach items="${list}" var="user">
				<tr>
					<td>${user.getId()}</td>
					<td>${user.getNome()}</td>
					<td>${user.getEmail()}</td>
					<td>${user.getSexo()}</td>
					<td>${user.getPais()}</td>
					<td>
						<a href="editUser.jsp?id=${user.getId()}">Edit</a>
					</td>
					<td>
						<a href="deleteUser.jsp?id=${user.getId()}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<br>
	
	<a href="newUser.jsp">Add new user</a>
</body>
</html>