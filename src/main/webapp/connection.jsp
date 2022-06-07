<%@page import="br.ifg.db.DB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%!
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void jspInit() {
		try {
			conn = DB.getConnection();
			stmt = conn.createStatement();			
		} catch (Exception e) {
			DB.close(conn, stmt);
		}
	}

	public void jspDestroy() {
		DB.close(conn, stmt, pstmt, rs);		
	}
%>

