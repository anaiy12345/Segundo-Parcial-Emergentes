
package com.emergente.controlador;

import com.emergente.modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       //verificar si la coleccion de personas ya existe en el objeto session
       HttpSession ses = request.getSession();
       int id,pos;
        if (ses.getAttribute("listapro")==null) {
            //crear la coleccion y almacenarla en el objeto session
            ArrayList<Producto> listaux = new ArrayList<Producto>();
            //colocar listaux como atributo de session
            ses.setAttribute("listapro", listaux);
            
        }
        ArrayList<Producto> lista = (ArrayList<Producto>)ses.getAttribute("listapro");
        
        String op = request.getParameter("op");
        String opcion =(op !=null)?op:"view";
        
        Producto obj1 = new Producto();
        
        
        switch(opcion){
            case "nuevo":
                request.setAttribute("miProducto", obj1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                 id= Integer.parseInt(request.getParameter("id") );
                 
                 pos= buscarIndice(request, id);
                 obj1 = lista.get(pos);
                 request.setAttribute("miProducto", obj1);
                 request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                id= Integer.parseInt(request.getParameter("id") );
                 
                 pos= buscarIndice(request, id);
                 lista.remove(pos);
                 request.getRequestDispatcher("index.jsp").forward(request, response);
            case "view":
                
                //ses.setAttribute("listaper", lista);
                response.sendRedirect("index.jsp");
                break;
        }        
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Producto obj1= new Producto();
        int idt;
        
        obj1.setId(Integer.parseInt(request.getParameter("id")) );
        obj1.setDescripcion(request.getParameter("descripcion"));
        obj1.setCantidad(Integer.parseInt(request.getParameter("cantidad")) );
        obj1.setPrecio( Double.parseDouble(request.getParameter("precio")) );
         obj1.setCategoria(request.getParameter("categoria") );
        HttpSession ses = request.getSession();
        ArrayList<Producto> lista = (ArrayList<Producto>) ses.getAttribute("listapro");
        
        idt = obj1.getId();
        
        if (idt==0) {
            obj1.setId(ultimoId(request));
            lista.add(obj1);
        }else{
            lista.set(buscarIndice(request, idt) , obj1);
        } 
        
        response.sendRedirect("index.jsp");       
        
        
        
    }

       private int ultimoId(HttpServletRequest request ){
        
        HttpSession ses = request.getSession();
        
        ArrayList<Producto> lista = (ArrayList<Producto>)ses.getAttribute("listapro");
        
        int idaux=0;
        for (Producto item : lista) {
            idaux = item.getId();
            
        }
        return idaux + 1;
    }

   private int buscarIndice(HttpServletRequest request, int id){
      HttpSession ses = request.getSession();
        
        ArrayList<Producto> lista = (ArrayList<Producto>)ses.getAttribute("listapro");
         int i =0;
         if (lista.size()>0) {
             while (i < lista.size()) {                 
                 if (lista.get(i).getId()== id) {
                     break;
                 }else{
                     i++;
                 }
             }
       }
       return i;
   }
}
