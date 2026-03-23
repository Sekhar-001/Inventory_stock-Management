<%@ page import="java.util.*,com.inventory.dao.ProductDAO,com.inventory.model.Product" %>

<%
/* =========================
   SESSION CHECK
========================= */
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
    return;
}

String base = request.getContextPath();

/* =========================
   SEARCH LOGIC (FIXED)
========================= */
String keyword = request.getParameter("search");

ProductDAO dao = new ProductDAO();
List<Product> list;

if(keyword != null && !keyword.trim().isEmpty()){
    list = dao.searchProducts(keyword);
} else {
    list = dao.getAllProducts();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>View Products</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Segoe UI';}
body{display:flex;background:#f1f5f9;}

.sidebar{
    width:240px;height:100vh;background:#1e293b;color:white;position:fixed;
}
.sidebar h2{padding:20px;text-align:center;background:#0f172a;}
.sidebar a{display:block;padding:15px;color:#cbd5e1;text-decoration:none;}
.sidebar a:hover{background:#334155;color:white;}

.main{margin-left:240px;width:100%;}

.topbar{
    background:white;padding:15px 20px;box-shadow:0 2px 5px rgba(0,0,0,0.1);
}

.container{padding:20px;}

table{
    width:100%;border-collapse:collapse;background:white;border-radius:10px;
    overflow:hidden;box-shadow:0 5px 15px rgba(0,0,0,0.05);
}

th{
    background:#3b82f6;color:white;padding:12px;text-align:left;
}

td{
    padding:12px;border-bottom:1px solid #eee;
}

tr:hover{background:#f9fafb;}

.btn{
    padding:6px 12px;border-radius:5px;text-decoration:none;color:white;
}

.edit{background:#10b981;}
.delete{background:#ef4444;}

.low{background:#fee2e2 !important;}

.msg{padding:10px;margin-bottom:10px;border-radius:5px;}
.success{background:#d1fae5;color:#065f46;}
.error{background:#fee2e2;color:#991b1b;}
</style>

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Inventory</h2>
    <a href="<%=base%>/dashboard.jsp">Dashboard</a>
    <a href="<%=base%>/add-product.jsp">Add Product</a>
    <a href="<%=base%>/view-products.jsp">View Products</a>
    <a href="<%=base%>/logout">Logout</a>
</div>

<!-- Main -->
<div class="main">

<div class="topbar">
    <h3>All Products</h3>
</div>

<div class="container">

<!-- Messages -->
<% if(request.getParameter("success") != null){ %>
    <div class="msg success">Product saved successfully</div>
<% } %>

<% if(request.getParameter("deleted") != null){ %>
    <div class="msg success">Product deleted successfully</div>
<% } %>

<% if(request.getParameter("error") != null){ %>
    <div class="msg error">Something went wrong</div>
<% } %>

<!-- 🔍 SEARCH -->
<div style="margin-bottom:20px; display:flex; gap:10px;">
    <form method="get" action="<%=base%>/view-products.jsp" style="display:flex; gap:10px;">

        <input type="text" name="search"
               placeholder="Search product..."
               value="<%= (keyword != null) ? keyword : "" %>"
               style="padding:10px;border:1px solid #ccc;border-radius:6px;width:250px;">

        <button type="submit"
                style="padding:10px 15px;background:#3b82f6;color:white;border:none;border-radius:6px;">
            Search
        </button>

        <a href="<%=base%>/view-products.jsp"
           style="padding:10px 15px;background:#6b7280;color:white;border-radius:6px;text-decoration:none;">
            Reset
        </a>

    </form>
</div>

<!-- TABLE -->
<table>
<tr>
    <th>Name</th>
    <th>Price</th>
    <th>Qty</th>
    <th>Category</th>
    <th>Action</th>
</tr>

<% for(Product p : list){ %>
<tr class="<%= p.getQuantity() < 5 ? "low" : "" %>">
    <td><%=p.getName()%></td>
    <td> <%=p.getPrice()%></td>
    <td><%=p.getQuantity()%></td>
    <td><%=p.getCategory()%></td>

    <td>
        <a class="btn edit" href="<%=base%>/edit-product.jsp?id=<%=p.getId()%>">Edit</a>
        <a class="btn delete" href="<%=base%>/product?action=delete&id=<%=p.getId()%>"
           onclick="return confirm('Delete this product?')">Delete</a>
    </td>
</tr>
<% } %>

</table>

<!-- No Data -->
<% if(list.isEmpty()){ %>
    <p style="margin-top:15px;color:red;">No products found</p>
<% } %>

</div>
</div>

</body>
</html>