<%@page import="com.emergente.modelo.Producto"%>
<%
    Producto item = (Producto)request.getAttribute("miProducto");
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#BDB76B">
        <h1><%= (item.getId()==0)?"Nuevo Producto":"Editar Producto "%></h1>
        
        <form action ="MainController" method="post">
            <input type="hidden" name="id" value="<%= item.getId() %>">
            
            <table  border="1"  bordercolor="#212F3C" cellspacing="0">
                <tr>
                    <td>DESCRIPCION</td>
                    <td><input type="text" name="descripcion" value="<%=  item.getDescripcion() %>"></td>
                </tr>
                <tr>
                    <td>CANTIDAD</td>
                    <td><input type="text" name="cantidad" value="<%=  item.getCantidad() %>"></td>
                </tr>
                
                <tr>
                    <td>PRECIO</td>
                    <td><input type="text" name="precio" value="<%= item.getPrecio() %>">
                    </td>
                </tr>
                <tr>
                    <td>CATEGORIA</td>
                    <td><select name="categoria" value="<%= item.getCategoria() %>"/>
                          <option>Bebidas</option>
                          <option>Galletas</option>
                          <option>Dulces</option>
                           <option>Comidas</option>
                           <option>Refrescos</option>
                          
                    </select> 
                    </td>  
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="ENVIAR"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
