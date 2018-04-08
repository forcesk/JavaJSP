# Ejemplos y Documentación de consulta de los temas vistos en el taller de JSP.

# Conexión a base de datos MySQL usando la Libreria JSTL

### Para realizar cualquier conexión a base de dato MySQL desde netBeans

* Libreria JDBC
* Libreria JSTL
* Estar en una pagina *.JSP*

## Importar librerias Necesarias en el JSP
```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
```


## La configuración necesaria para poder realizar cualquier operación con la base de datos

```
<sql:setDataSource var ="dataSource" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/[Nombre-Base-de-Datos]" user="[usuario]" password="[contraseña]" />
```
> Donde se necesitan modificar los valores de (Nombre de base de datos,usuario y contraseña



### Etiqueta de Query sencilla a Base de datos
```
 <sql:query dataSource = "${dataSource}" var="result">
            Select *from actor;
</sql:query>

```

### Ejemplo de Query Sencilla con "Try-Catch" para testear conexión correcta
[Link del Codigo](https://github.com/forcesk/JavaJSP/blob/master/Prueba-Con.jsp)

``` JSP
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

```
En este caso la base de datos empleadas es "Sakila" la cuál viene por defecto instalado en la mayoria 
de los servidores de MySQL.  
[Documentación: Sakila](https://dev.mysql.com/doc/sakila/en/)
Si por alguna razón no la tienes instalada la puedes descargar [aquí](https://dev.mysql.com/doc/index-other.html) .






## Consulta Sencilla

Para realizar una consulta sencilla se utiliza la misma etiqueta "Sql:Query", pero despues de realizar la consulta
se realiza un foreach mediante para poder imprimir cada uno de los resultados en el navegador.
[Link del Codigo](https://github.com/forcesk/JavaJSP/blob/master/QuerySakila.jsp)


```jsp
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
```
### Podemos notar que la estructura de un foreach es muy simple:

```jsp
<c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.actor_id}"/></td>
                        <td><c:out value="${row.first_name}"/></td>
                        <td><c:out value="${row.last_name}"/></td>
                        <td><c:out value="${row.last_update}"/></td>
                     </tr>
</c:forEach> 
```
> En este caso la variable "row" se encuentra cargada con los resultados del query.



[Link al Repositorio con todos los ejemplos](https://forcesk.github.io/testing/test2)

