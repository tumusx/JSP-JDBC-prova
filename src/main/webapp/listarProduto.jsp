<%@ include file="/layout/cabecalho.jsp"%>

<section class="ftco-section">
	<div class="container">

		<div class="row justify-content-center">

			<div class="col-sm-10">
				<div class="login-wrap p-4 p-md-5">
					<div class="d-flex">
						<div class="w-100">
							<h2 class="mb-4" style="text-align: center;"><b>LISTA DE PRODUTOS</b></h2>
						</div>
					</div>

					<table class="table table-striped">
						<tr>
							<th>CODIGO</th>
							<th>DESCRICAO</th>
							<th>CATEGORIA</th>
							<th>PREÇO</th>
					
							<th>&nbsp;</th>
							<th>&nbsp;</th>
						</tr>

						<%
						rs = stmt.executeQuery("select * from produto ORDER BY id");
						while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getInt("id")%></td>
							<td><%=rs.getString("DESCRICAO")%></td>
							<td><%=rs.getString("CATEGORIA")%></td>
							<td><%=rs.getFloat("PRECO")%></td>
							
							<td><a href="editarProduto.jsp?id=<%=rs.getInt("id")%>"><button type="button" class="btn btn-info"> <span class="glyphicon glyphicon-edit" aria-hidden="true"></span></button></a></td>
							<td><a href="javascript:jsExcluir(<%=rs.getInt("id")%>)"><button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></a></td>
						</tr>
						<%
						}
						%>

					</table>

					<br> <a href="inserirProduto.jsp"><button type="button" class="btn btn-success">Inserir Produto</button></a>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
	function jsExcluir(id) {

		if (confirm("Tem certeza que deseja excluir?")) {
			location.href = "excluirProduto.jsp?id=" + id;
		}

	}
</script>

<%@ include file="layout/rodape.jsp"%>

