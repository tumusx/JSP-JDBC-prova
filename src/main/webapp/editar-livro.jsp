<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@ include file="connection.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
int id = 0;
String descricao = null;
String categoria = null;
int preco = 0;

String idUpdate = request.getParameter("id");

if (idUpdate != null) {

	if (request.getParameter("btnEnviar") == null) {
		pstmt = conn.prepareStatement("SELECT * FROM produto WHERE id = ?");
		pstmt.setString(1, idUpdate);
		rs = pstmt.executeQuery();

		if (!rs.next()) {
			response.sendRedirect("listar-livros.jsp");
				} else {
			id = rs.getInt("id");
			descricao = rs.getString("descricao");
			categoria = rs.getString("categoria");
			preco = rs.getInt("preco");
				}

	} else {
		id = Integer.parseInt(request.getParameter("id"));
		descricao = request.getParameter("descricao");
		categoria = request.getParameter("categoria");
		preco = Integer.parseInt(request.getParameter("preco"));
	}
} else {
	response.sendRedirect("listar-livros.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exemplo: JSP</title>
</head>
<body>

	<h1>Editar Livro</h1>

	<form action="" method="post">
		<label>DESCRICAO</label><br> <input name="descricao" type="text" value="<%=descricao%>"><br> <br>
		 <label>CATEGORIA</label><br><input name="categoria" type="text" value="<%=categoria%>"><br>
		 <label>PRECO</label><br> <input name="preco" type="number" value="<%=preco%>"><br> <br>
		<br> <input name="btnEnviar" type="submit" value="Enviar">
	</form>
	<br>

	<%
	if (request.getParameter("btnEnviar") != null) {

		if (descricao != null && categoria != null && !descricao.trim().equals("") && !categoria.trim().equals("")) {

			pstmt = conn.prepareStatement("UPDATE produto SET DESCRICAO = ?, CATEGORIA = ?, PRECO = ? WHERE id = ?, ");
			pstmt.setString(1, descricao);
			pstmt.setString(2, categoria);
			pstmt.setInt(3, preco);
			pstmt.setInt(4, id);
			pstmt.execute();
			
			int rowsAffected = pstmt.executeUpdate();
			out.print((rowsAffected > 0) ? "<p>Produto Atualizado com Sucesso.</p>" : "<p>Erro ao Atualizar o Produto.</p>");			

		} else {
			out.print("<p>Por favor preenchar todos os campos.</p>");
		}
	}
	%>

	<a href='listar-livros.jsp'>Voltar</a>

</body>
</html>


