<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/sakila" user="root" password="*****" />
       
         <%
         try 
         {
          %>
             <sql:query dataSource="${dataSource}" var="result">
            Select *from actor;
            </sql:query>
            
            <h1>Conexión exitosa!</h1>
         <%}
         catch (Exception e) 
         {
            out.println("ERROR: " + e.getMessage());
         }
      %>
    </head>
    <body>        
    </body>
</html>