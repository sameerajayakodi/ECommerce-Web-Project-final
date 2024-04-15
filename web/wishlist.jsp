<%@page import="mainPackage.wishlist"%>
<%@page import="mainPackage.WishlistItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Wishlist</title>
   <link rel="stylesheet" type="text/css" href="css/wishlist.css">
   <jsp:include page="./WEB-INF/components/Imports.jsp" />
</head>
<body>
    <jsp:include page="./WEB-INF/components/nav.jsp" />
    <div class="max-container">
        <div class="wishlist-header">
            <h1>My Wishlist</h1>
            <hr />
        </div>
        <!-- Display total number of items -->
        <div class="wishlist-summary">
            <% List<WishlistItem> wishlistItems = wishlist.getAllItems(); %>
            <h3><%= wishlistItems.size() %> Items in Your Wishlist</h3>
        </div><br>
        <div class="wishlist-items">
            <% 
                
                for (WishlistItem item : wishlistItems) { 
            %>
            <div class="wishlist-item">
                <div class="product-image">
                    <img src="img/<%= item.getImg() %>" alt="<%= item.getName() %>" />
                </div>
                <div class="product-details">
                    <h2><%= item.getName() %></h2>
                    <p>Price: $<%= item.getPrice() %></p>
                    <form action="WishlistServlet" method="post">
                        <input type="hidden" name="id" value="<%= item.getId() %>">
                        <button class="remove-button" type="submit" name="action" value="remove">Remove</button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    <br><br>
    <jsp:include page="./WEB-INF/components/footer.jsp" />
</body>
</html>
