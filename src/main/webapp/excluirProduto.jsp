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

	<h1>EXCLUIR PRODUTO</h1>
	
	<%
	if (request.getParameter("id") != null) {

		String id = request.getParameter("id");

		pstmt = conn.prepareStatement("DELETE FROM produto WHERE id = ?");
		pstmt.setString(1, id);

		int rowsAffected = pstmt.executeUpdate();
		out.print((rowsAffected > 0) ? "<p>PRODUTO Deletado com Suesso.</p>" : "<p>Erro ao Excluir o PRODUTO.</p>");

	} else {
		response.sendRedirect("listarProduto.jsp");
	}
	%>
	<a href='listarProduto.jsp'>Voltar</a>

</body>
</html>


