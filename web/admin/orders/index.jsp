<%@page import="mainPackage.Tools"%>
<% String admin = (String)session.getAttribute("admin"); 
    if(admin == null){
%>

<jsp:include page="../../WEB-INF/components/adminLogin.jsp"/>
<%}else{%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="mainPackage.DatabaseLogIn, models.*, java.util.ArrayList" %>
<%
    DatabaseLogIn db = new DatabaseLogIn();
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Orders</title>
    <jsp:include page="../../WEB-INF/components/adminImports.jsp">
      <jsp:param name="path" value="../" />
    </jsp:include>
    <style type="text/tailwindcss">
      @layer utilities {
        .list-header {
          @apply flex justify-between text-center font-semibold text-sm;
        }
        .list-item {
          @apply flex items-center border rounded-lg py-2 text-center text-xs hover:bg-gray-200 duration-300 ease-in-out;
        }
        .item-width {
          @apply w-[20%];
        }
      }
    </style>
  </head>
  <body>
    <jsp:include page="../../WEB-INF/components/adminHead.jsp">
      <jsp:param name="path" value="../" />
      <jsp:param name="no" value="2" />
    </jsp:include>

    <nav class="flex" aria-label="Breadcrumb">
      <ol
        class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse"
      >
        <li class="inline-flex items-center">
          <a
            href="../"
            class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white"
          >
            <svg
              class="w-3 h-3 me-2.5"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="currentColor"
              viewBox="0 0 20 20"
            >
              <path
                d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"
              />
            </svg>
            Dashboard
          </a>
        </li>
        <li aria-current="page">
          <div class="flex items-center">
            <svg
              class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 6 10"
            >
              <path
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="m1 9 4-4-4-4"
              />
            </svg>
            <span
              class="ms-1 text-sm font-medium text-gray-500 md:ms-2 dark:text-gray-400"
              >Orders</span
            >
          </div>
        </li>
      </ol>
    </nav>
      
        
        <%
            String type = request.getParameter("type");
            int a = 8;
            if(type!=null){
                if(type.equals("new")) a=1;
                else if(type.equals("processing")) a=2;
                else if(type.equals("shipped")) a=3;
                else if(type.equals("completed")) a=4;
                else if(type.equals("canceled")) a=5;
                else if(type.equals("declined")) a=6;
                else if(type.equals("returned")) a=7;
            }
            ArrayList<Order> acc = db.getOrders(a,"no");
            
        %>

      <div class="flex flex-col items-start md:flex-row gap-5">

        <div class="box md:w-[15%] max-md:w-full">
          <div class="flex flex-row md:flex-col gap-2 md:gap-1  max-md:justify-between px-1 md:px-3 py-2 max-md:text-xs text-sm max-md:text-center">
              <a href="./index.jsp" class="<%= a==8? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">All<span class="max-md:hidden"> Orders</span></a>
              <a href="./index.jsp?type=new" class="<%= a==1? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">New<span class="max-md:hidden"> Orders</span></a>
              <a href="./index.jsp?type=processing" class="<%= a==2? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">Inprogress<span class="max-md:hidden"> Orders</span></a>
              <a href="./index.jsp?type=shipped" class="<%= a==3? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">Shipped<span class="max-md:hidden"> Orders</span>s</a>
              <a href="./index.jsp?type=completed" class="<%= a==4? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">Completed<span class="max-md:hidden"> Orders</span></a>
              <a href="./index.jsp?type=canceled" class="<%= a==5? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">Canceled<span class="max-md:hidden"> Orders</span></a>
              <a href="./index.jsp?type=declined" class="<%= a==6? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">Declined<span class="max-md:hidden"> Orders</span></a>
              <a href="./index.jsp?type=returned" class="<%= a==7? "w-full bg-gray-100 p-2 rounded-lg font-semibold" : "w-full hover:bg-gray-100 hover:px-2 py-2 hover:rounded-lg hover:font-semibold  duration-300 ease-in-out" %>">Returned<span class="max-md:hidden"> Orders</span></a>
          </div>
        </div>
          
            
       <div class="box w-full  md:w-[85%]">
          <div class="box-title">Orders</div>
          <div class="box-body">
            <div class="list-header">
              <div class="item-width">Order ID</div>
              <div class="item-width">User</div>
              <div class="item-width">Date</div>
              <div class="item-width max-md:hidden">Time</div>
              <div class="item-width max-md:hidden">No Of Items</div>
              <div class="item-width">Amount</div>
              <div class="item-width">status</div>
            </div>
            <div class="flex flex-col gap-1">
               <%
                   
                   if(acc.size()>0){
                   for(int i=0;i<acc.size();i++){
                   String[]cc = Tools.getOrderColor(acc.get(i));
               %>
               <a href="./order.jsp?id=<%= acc.get(i).getId() %>"  class="list-item justify-between">
                  <div class="item-width">#<%= acc.get(i).getId() %></div>
                <div class="item-width line-clamp-1"><%= acc.get(i).getUser().getEmail() %></div>
                <div class="item-width"><%= acc.get(i).getDate() %></div>
                <div class="item-width max-md:hidden"><%= acc.get(i).getTime() %></div>
                <div class="item-width max-md:hidden"><%= acc.get(i).getItems().size() %></div>
                <div class="item-width">LKR <%= acc.get(i).getTotal() %></div>
                <div class="item-width flex items-center justify-center md:px-5"><div class="md:w-full text-xs rounded-full px-2 py-1 <%=cc[0]%>"><%=cc[1]%></div></div>
              </a>
              <%}}else{%>
              <div class="list-item justify-center">No Records Found</div>
              <% } %>
            </div>
          </div>
        </div>
            
      </div>
            

    <jsp:include page="../../WEB-INF/components/adminBottom.jsp" />
  </body>
</html>
<% db.closeDb(); %>
<%}%>