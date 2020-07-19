package Servlets;

import Classes.Palavras;
import Classes.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thiago
 */
@WebServlet(name = "VerificarPalavras", urlPatterns = {"/VerificarPalavras"})
public class VerificarPalavras extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String palavra = request.getParameter("txtPalavra").toLowerCase();

        HttpSession session = request.getSession();
        int controle = (int) session.getAttribute("CONTROLE");
        ArrayList<Palavras> lista = (ArrayList<Palavras>) session.getAttribute("LISTAPALAVRAS");

        String palavraCorreta = lista.get(controle).getPalavra();
        
        //TESTE PARA ENVIAR A PALAVRA RESPOSTA PARA A TELA
        //request.setAttribute("TESTE", palavraCorreta);  

        RequestDispatcher rd = null;

        if (palavra.equals(palavraCorreta)) {
            request.setAttribute("ACERTO", true);

            Usuarios u = (Usuarios) session.getAttribute("USUARIO");
            u.setPontos((u.getPontos() + 1));

            controle++;
            session.setAttribute("CONTROLE", controle);

            if (controle < lista.size()) {
                rd = request.getRequestDispatcher("jogar.jsp");
            } else {
                u.atualizarPontos();
                rd = request.getRequestDispatcher("ranking.jsp");
            }
        } else {
            request.setAttribute("ACERTO", null);
            rd = request.getRequestDispatcher("jogar.jsp");
        }
        //String registerForm = "index.jsp";
        //RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
        //dispatcher.forward(request, response);
        rd.forward(request, response);

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet verificarPalavra</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet verificarPalavra at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
