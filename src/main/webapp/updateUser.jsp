<%@ page import="com.crud.dao.UserDAO" %>
<jsp:useBean id="u" class="com.crud.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	int i = UserDAO.updateUser(u);

	response.sendRedirect("users.jsp");
%>