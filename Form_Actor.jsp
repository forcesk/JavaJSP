<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
         <form action="AgregarDB.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <caption>Introduce de los datos del actor</caption>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th><label>ID</label></th>
                        <th><label>Nombre</label></th>
                        <th><label>Apellido</label></th>
                        <th><label>Fecha</label></th>
                        
                    </tr>
                    <tr>
                        <td><input style="width:160px; height: 25px;" type="text" name="idActor"/></td>
                        <td><input style="width:160px; height: 25px;" type="text" name="NombreAc"/></td>
                        <td><input style="width:160px; height: 25px;" type="text" name="ApellidoAc"/></td>
                        <td><input style="width:160px; height: 25px;" type="text" name="Fecha"/></td>
                       </tr>
                     <tr>
                        <td></td>
                        <td></td>
                        <td><input style="font-family: verdana" type="submit" value="Enviar" class="icon-export myButton myButton-hover myButton-active"/></td>
                        <td><input style="font-family: verdana" type="reset" value="Borrar" class="icon-trash myButton myButton-hover myButton-active"/></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
