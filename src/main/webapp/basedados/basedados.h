<%@ page import="java.sql.*" %>
<%
  
    String url = "jdbc:mysql://localhost:3306/est_academy";
    String dbUser = "root";  
    String dbPassword = "";  

    Connection conn = null;

    try {
       
        Class.forName("com.mysql.cj.jdbc.Driver");

       
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // Set auto commit to false for transaction control
        conn.setAutoCommit(false);

        // Store the connection object in request scope (for reuse in other JSPs)
       // request.setAttribute("dbConnection", conn);
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace(); 
    }
%>
