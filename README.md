# Conexión a base de datos MySQL usando la Libreria JSTL

### Requisitos
* [MySQL](https://dev.mysql.com/downloads/installer/)
* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* [Netbeans EE](https://netbeans.org/features/java-on-server/java-ee.html)


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

## Realizar un Insert into en la DB

#### En este caso el la inserción se realiza en dos pasos, el primero es pedir los datos a ingresar, el segundo es mandar los datos para que sean ingresados a la base de datos.

##### *Captura de datos*

```jsp

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
       
         <form action="[JSP-Destino].jsp" method="post">
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
                        <td><input type="text" name="idActor"/></td>
                        <td><input type="text" name="NombreAc"/></td>
                        <td><input type="text" name="ApellidoAc"/></td>
                        <td><input type="text" name="Fecha"/></td>
                       </tr>
                       
                     <tr>
                        <td></td>
                        <td></td>
                        <td><input type="submit" value="Enviar" class="icon-export myButton myButton-hover myButtonactive"/></td>
                        <td><input type="reset" value="Borrar" class="icon-trash myButton myButton-hover myButton-active"/></td>
                        <td></td>
                        <td></td>
                    </tr>
            
                </tbody>
            </table>
        </form>
        
    </body>
</html>

```
> Notar que en el Form-Action Se debe reemplazar "JSP-Destino" con el nombre del JSP al que se desea enviar los datos ingresados.


### El segundo paso, ingresar los datos recibidos a la base de datos
```jsp
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
                           user="root"  password="12345a"/>
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
```
### Documentos
> [Link Aqui.](https://github.com/forcesk/JavaJSP/tree/master/Documentos%20de%20consulta)

### Links de interés
> [Link al Repositorio con todos los ejemplos](https://github.com/forcesk/JavaJSP)




###### Esta Pagina se encuentra en construcción...

