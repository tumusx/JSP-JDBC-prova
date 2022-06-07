<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
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

	<h1>Inserir Produto</h1>

	<form action="" method="post">
		<label>DESCRICAO</label><br> <input name="codigo" type="text"><br>
		<br><label>CATEGORIA</label><br> <input name="categoria" type="text"><br>
		 <br><label>PRECO</label><br> <input name="preco" type="number" maxlength="50"><br> <br> <input name="btnEnviar"
			type="submit" value="Enviar">
	</form>
	<br>

	<%
	if (request.getParameter("btnEnviar") != null) {

		String descricao = request.getParameter("codigo");
		String categoria = request.getParameter("categoria");
		int preco =  Integer.parseInt(request.getParameter("preco"));
		if (descricao != null && categoria != null && !descricao.trim().equals("") && !categoria.trim().equals("")) {

			pstmt = conn.prepareStatement("INSERT INTO produto (DESCRICAO, CATEGORIA, PRECO) VALUES (?,?,?)");
			pstmt.setString(1, descricao);
			pstmt.setString(2, categoria);
			pstmt.setInt(3, preco);

			
			int rowsAffected = pstmt.executeUpdate();				
			out.print((rowsAffected > 0) ? "<p>Registro Inserido com Sucesso.</p>": "<p>Erro ao Inserir o Registro.</p>");	
			

		} else {
			out.print("<p>Por favor preenchar todos os campos.</p>");
		}		
	}
	%>
	
	<a href='listar-livros.jsp'>Voltar</a>
	
</body>
</html>


