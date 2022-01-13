<%@ page import="com.crud.dao.UserDAO, java.util.*" %>

<%
	boolean i = UserDAO.deleteUser(Integer.parseInt(request.getParameter("id")));

	response.sendRedirect("users.jsp");
%>