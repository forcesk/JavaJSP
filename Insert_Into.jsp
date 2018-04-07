@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/sakila"
                           user="root"  password="*****"/>
    </head>
    <body>
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO actor(actor_id, first_name, last_name, last_update) VALUES (?,?,?,?);
            <sql:param value="${param.idActor}" />
            <sql:param value="${param.NombreAc}" />
            <sql:param value="${param.ApellidoAc}" />
            <sql:param value="${param.Fecha}" />
        </sql:update>
            
            <h2>Datos Agregados!</h2>
            <a href="index.jsp">Regresar</a>
    </body>
</html>
@forcesk
