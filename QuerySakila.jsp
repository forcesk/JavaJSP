<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <sql:setDataSource var ="dataSource" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/sakila" user="root" password="*****" />
        
    </head>
    
    <body>
        
        <sql:query dataSource = "${dataSource}" var="result">
            Select *from actor;
        </sql:query>
            
        <table border="1" width="40%">
                <caption>Actores Mi Pelicula</caption>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Ultima Actu.</th>
                </tr>
               
          <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.actor_id}"/></td>
                        <td><c:out value="${row.first_name}"/></td>
                        <td><c:out value="${row.last_name}"/></td>
                        <td><c:out value="${row.last_update}"/></td>
                     </tr>
         </c:forEach>   
                     
    </body>
</html>