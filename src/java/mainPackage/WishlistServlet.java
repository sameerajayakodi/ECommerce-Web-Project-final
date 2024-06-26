package mainPackage;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Product;
import models.User;


@WebServlet(name = "WishlistServlet", urlPatterns = {"/WishlistServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class WishlistServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//          response.setContentType("application/json");
          String idString = request.getParameter("id");
          int id = Integer.parseInt(idString);
          
          PrintWriter out = response.getWriter();
          DatabaseLogIn db = new DatabaseLogIn();
          HttpSession session = request.getSession(true);
          
          if(session.getAttribute("user")!=null){
              User user = (User)session.getAttribute("user");
              ArrayList<Product> list = db.getWishlist(user.getId());
              if(db.isExistWishlist(user.getId(), id)){
                  db.removeWishlist(user.getId(), id);
                  db.closeDb();
                  out.print("{\"st\": \"removeds\", \"qt\": \""+(list.size()-1)+"\"}");
              }else{
                  db.addWishlist(user.getId(), id);
                  db.closeDb();
                  out.print("{\"st\": \"added\", \"qt\": \""+(list.size()+1)+"\"}");
              }
          }else{
              db.closeDb();
              out.print("{\"st\": \"notlogin\", \"qt\": \"1\"}");
          }
          out.flush();
          
          
    }
    


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

