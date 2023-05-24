<%@page import="java.util.ArrayList"%>
<%@page import="com.emergente.modelo.Producto"%>
<%
    ArrayList<Producto> lista = (ArrayList<Producto>) session.getAttribute("listapro");
    

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#ff7fb0">
                <h1>SEGUNDO PARCIAL TEM-742</h1>
                <p>NOMBRE: Melissa Anai Angulo Gomez</p>
                <p>NUM_CARNET: 13443517</p>
    <center> <h1>GESTIÓN DE PRODUCTOS</h1> </center>
        <a href="MainController?op=nuevo" color="F5733"> <h3>NUEVO PRODUCTO</h3></a>
        <table border="2"  bordercolor="#F5733" cellspacing="0">
            
            <tr>
                <th height="50" width="150"  bgcolor="#f0f8ff">ID</th>
                <th height="50" width="150"  bgcolor="#f0f8ff">DESCRIPCION</th>
                <th height="50" width="150"  bgcolor="#f0f8ff">CANTIDAD</th>
                <th height="50" width="150"  bgcolor="#f0f8ff">PRECIO</th>
                 <th height="50" width="150"  bgcolor="#f0f8ff">CATEGORIA</th>
                <th height="50" width="150"  bgcolor="#f0f8ff">EDITAR</th>
                <th height="50" width="150"  bgcolor="#f0f8ff">ELIMINAR</th>
            </tr>
            <%
                if (lista != null) {
                        
                    for (Producto item : lista) {
                            
                        
                %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getDescripcion() %></td>
                <td><%= item.getCantidad() %></td>
                <td><%= item.getPrecio() %></td>
                 <td><%= item.getCategoria() %></td>
                <td><a href="MainController?op=editar&id=<%= item.getId() %>">EDITAR</a></td>
                <td><a href="MainController?op=eliminar&id=<%= item.getId() %>" onclick="return confirm('Esta seguro de Eliminar?')">ELIMINAR</a></td>
            </tr>
            
            <%
                }
             }
                %>
                
        </table>
    </body>
</html>
