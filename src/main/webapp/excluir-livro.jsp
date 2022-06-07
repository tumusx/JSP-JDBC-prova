<%@ include file="connection.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exemplo: JSP</title>
</head>
<body>

	<h1>Excluir Livro</h1>
	
	<%
	if (request.getParameter("id") != null) {

		String id = request.getParameter("id");

		pstmt = conn.prepareStatement("DELETE FROM livro WHERE id = ?");
		pstmt.setString(1, id);

		int rowsAffected = pstmt.executeUpdate();
		out.print((rowsAffected > 0) ? "<p>Registro Deletado com Suesso.</p>" : "<p>Erro ao Excluir o Registro.</p>");

	} else {
		response.sendRedirect("listar-livros.jsp");
	}
	%>
	<a href='listar-livros.jsp'>Voltar</a>

</body>
</html>


