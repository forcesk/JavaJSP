<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualización de datos de usuario</title>
    </head>
    <body>
    
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/sakila"
                           user="root"  password="*****"/>
                           
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE actor SET first_name = ?, last_name=?, last_update =?
            WHERE actor_id='${param.actor_id}'
            <sql:param value="${param.first_name}" />
            <sql:param value="${param.last_name}" />
            <sql:param value="${param.last_update}" />
        </sql:update>
        
              <a href="index.jsp" Regresar></a>          
        </center>

    </body>
</html>
