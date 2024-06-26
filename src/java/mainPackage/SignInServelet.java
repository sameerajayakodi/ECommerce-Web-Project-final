package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

@WebServlet(name = "SignInServlet", urlPatterns = {"/SignInServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class SignInServelet extends HttpServlet {
    
@Override   
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        HttpSession session = request.getSession(true);
        String email= request.getParameter("email");
        String password= request.getParameter("password");
        PrintWriter out=response.getWriter();
        
        DatabaseLogIn db= new DatabaseLogIn();
        User user = db.signIn(email, password);
        db.closeDb();
        if(user.getId()>0){
            session.setAttribute("user", user);
            if(session.getAttribute("logreq")==null){
                out.print("ok");
            }else{
                out.print(session.getAttribute("logreq"));
                session.removeAttribute("logreq");
            }
        }
        else if(user.getId()==-2){
            out.print("banned");
        }else{
            out.print("bad");
        }
        
        
}

}
