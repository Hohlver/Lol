<%-- 
    Document   : A
    Created on : 18-07-2024, 11:55:02
    Author     : Ethan
--%>

<%@page import="java.util.List"%>
<%@page import="model.N"%>
<%@page import="service.DAON"%>
<%@page import="db.ConexionSingleton"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        ConexionSingleton oConexion = ConexionSingleton.getInstance();
        DAON oDAON= new DAON(oConexion);
        List<N> oList = oDAON .getAll().get();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>A</title>
        <link rel="stylesheet" href="../css/materialize.css"/>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper">  
                <a href="../index.jsp" class="brand-logo">Inicio</a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="">A</a> </li>
                    <li><a href="">B</a></li>
                    
                </ul>
            </div>
        </nav>

        <div class="row">
            <div class="card-panel">
                <h4>Añadir</h4>
                <form name="datos" method="post" action="../Agregar.do">
                    <div class="input-field">
                        <input id="nombre" type="text" name="txtA" placeholder="">

                    </div>

                    <button class="btn waves-effect waves-light" type="submit" name="action">Crear</button>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="card-panel">
                <h4>Lista</h4>
                <table class="responsive-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>A</th>
                            <th>B</th>
                            <th>C</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (N oN : oList) {%>
                        <tr>
                            <td><%= oN.getId()%></td>
                            <td><%= oN.getA()%></td>
                            <td><%= oN.getB()%></td>
                            <td><%= oN.getC()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
                    
        <div class="row">
            <div class="card-panel">
                <h4>Editar</h4>
                <form name="datosUs" method="post" action="../Editar.do">
                    <div class="input-field">
                        <input id="id" type="number" name="txtIdE " placeholder="ID">

                    </div>
                    <div class="input-field">
                        <input id="titulo" type="text" name="txtAE" placeholder="">

                    </div>

                    <button class="btn waves-effect waves-light" type="submit" name="action">Editar</button>
                </form>
            </div>
            
        </div>

        <div class="row">
            <div class="card-panel">
                <h4>Eliminar</h4>
                <form name="datosUs" method="post" action="../Eliminar.do">
                    <div class="input-field">
                        <input id="id" type="number" name="txtIdE" placeholder="ID">

                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Eliminar</button>
                </form>
            </div>
        </div>



        <footer class="page-footer">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <h5 class="white-text">Footer Content</h5>
                        <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
                    </div>
                    <div class="col l4 offset-l2 s12">
                        <h5 class="white-text">Links</h5>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    © 2024 Copyright Text
                    <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
                </div>
            </div>
        </footer>
    </body>
</html>
