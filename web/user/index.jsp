<%-- 
    Document   : index
    Created on : Apr 16, 2024, 8:49:43 PM
    Author     : Ravindu
--%>
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%
    if(session.getAttribute("user")==null){
        session.setAttribute("logreq", "./user/");
        response.sendRedirect("../signin.jsp");
    }else{
        User user = (User)session.getAttribute("user");
        DatabaseLogIn db = new DatabaseLogIn();  
        User details = db.getUser(user.getId()+"");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Details</title>
        <link rel="stylesheet" href="../css/userstyle.css" type="text/css"/>
        <jsp:include page="../WEB-INF/components/Imports.jsp">
            <jsp:param name="path" value="../"/>
        </jsp:include>
    </head>
    <body>
            <jsp:include page="../WEB-INF/components/nav.jsp" >
                <jsp:param name="path" value="../"/>
            </jsp:include>   
            
            <div class="main-container wrapper">
                <div class="sidebar">
                    <h2>My Account</h2>
                    <ul>
                        <li class="bg-[#405270] text-white"><div><i class="fa-solid fa-circle-user"></i>&nbsp;&nbsp;My Details</div></li>
                        <li><a href="addressbook.jsp"><i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;My Address Book</a></li>
                        <li><a href="order.jsp"><i class="fa-solid fa-bag-shopping"></i>&nbsp;&nbsp;My Orders</a></li>
                        <li><a href="accountsettings.jsp"><i class="fa-solid fa-gear"></i>&nbsp;&nbsp;Account Settings</a></li>
                    </ul>
                </div>
                <div class="w_box">
                    <h1>My Details</h1>
                    <div class="personal_information">
                        <h2>Personal Information</h2>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="column">
                                <p class="gtext">Feel free to edit any of your details so your account is up to date.</p>
                            </div>
                            <form id="details" action="../updateUserDetails" method="post" class="column">
                                <div class="flex gap-5">
                                    <p>First Name<br>
                                        <input type="text" class="txt" name="fname" placeholder="first name" value="<%= details.getFname()==null?"":details.getFname() %>">
                                    </p>
                                    <p>Last Name<br>
                                    <input type="text" class="txt" name="lname" placeholder="last name" value="<%= details.getLname()==null?"":details.getLname() %>">
                                </p>
                                </div>
                                <br>
                                <p>Birth Date<br>
                                    <input type="date" class="txt" name="bday" value="<%= details.getBday()==null?"":details.getBday() %>">
                                </p>
                                <br>
                                <p>Phone Number<br>
                                    <input type="number" class="txt" name="tno" value="<%= details.getPno()==null?"":details.getPno() %>"><br>
                                <p class="stxt">Keep 9-digit format with no spaces and dashes.</p>
                                </p>
                                <br>
                                <p><input type="submit" class="btn" value="SAVE CHANGES" ></p>
                                
                            </form>
                        </div>
                    </div>

                    <div class="email_address">
                        <h2>E-mail Address</h2>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="column">
                                <p class="gtext">Feel free to edit any of your details so your account is up to date.</p>
                            </div>
                            <form id="emailup" action="../updateEmail" method="POST" class="column">
                                <p>Email Address<br>
                                    <input type="text" name="email" class="txt" value="<%= details.getEmail() %>">
                                </p>
                                <br>
                                <p>Password<br>
                                    <input type="password" name="password" class="txt" autocomplete="off">
                                </p>
                                <br>
                                <p><input type="submit" class="btn" value="SAVE CHANGES"></p>
                                
                            </form>
                            <div class="column">
                            </div>
                        </div>
                    </div>

                    <div class="password">
                        <h2>Password</h2>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="column">
                                <p class="gtext">Feel free to edit any of your details so your account is up to date.</p>
                            </div>
                            <form id="passwordup" class="column" action="../updatePassword"  method="post">
                                <p>Current Password<br>
                                    <input type="password" name="oldpassword" class="txt" autocomplete="off">
                                </p>
                                <br>
                                <p>New Password<br>
                                    <input type="password" name="newpassword1" class="txt" autocomplete="off"><br>
                                <p class="stxt">Make sure your password is 8 characters long and contains letters and numbers.</p>
                                </p>
                                <br>
                                <p>Confirm Password<br>
                                    <input type="password" name="newpassword2" class="txt" autocomplete="off">
                                </p>
                                <br>
                                <p><input type="submit" class="btn" value="SAVE" ></p>
                            </form>
                            <div class="column">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <jsp:include page="../WEB-INF/components/footer.jsp" />

            <script>    
      $(document).ready(function () {
        $("#details").submit(function (e) {
          e.preventDefault();
          var formData = new FormData(this);
          Swal.fire({
            title: "Are you sure?",
            text: "Are you sure you want to update details.",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Update"
          }).then((result) => {
            if (result.isConfirmed) {
              $.ajax({
              type: "POST",
              url: "../updateUserDetails",
              data: formData,
              processData: false,
              contentType: false,
              success: function (response) {
//                location.reload();
              },
              error: function (xhr, status, error) {
                console.error(xhr.responseText);
              },
              });
            }
          });
          });
          
          $("#emailup").submit(function (e) {
          e.preventDefault();
          var formData = new FormData(this);
          Swal.fire({
            title: "Are you sure?",
            text: "Are you sure you want to update Email.",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Update"
          }).then((result) => {
            if (result.isConfirmed) {
              $.ajax({
              type: "POST",
              url: "../updateEmail",
              data: formData,
              processData: false,
              contentType: false,
              success: function (response) {
                  if(response=="ok"){
                      location.replace("../signin.jsp")
                  }else{
                      Swal.fire({
            title: "Error",
            text: "Password is not matched",
            icon: "warning",
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "ok"
          });
                  }
              },
              error: function (xhr, status, error) {
                console.error(xhr.responseText);
              },
              });
            }
          });
            
        });
        
        $("#passwordup").submit(function (e) {
          e.preventDefault();
          var formData = new FormData(this);
          Swal.fire({
            title: "Are you sure?",
            text: "Are you sure you want to update Password.",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Update"
          }).then((result) => {
            if (result.isConfirmed) {
              $.ajax({
              type: "POST",
              url: "../updatePassword",
              data: formData,
              processData: false,
              contentType: false,
              success: function (response) {
                  if(response=="ok"){
                      location.replace("../signin.jsp")
                  }else{
                      Swal.fire({
            title: "Error",
            text: "Password is not matched",
            icon: "warning",
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "ok"
          });
                  }
              },
              error: function (xhr, status, error) {
                console.error(xhr.responseText);
              },
              });
            }
          });
            
        });
        
      });
    </script>

    </body>
</html>
<%}%>