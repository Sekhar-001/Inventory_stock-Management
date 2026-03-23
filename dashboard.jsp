<%@ page import="java.util.*,com.inventory.dao.ProductDAO,com.inventory.model.Product" %>

<%
ProductDAO dao = new ProductDAO();
List<Product> list = dao.getAllProducts();

int totalProducts = list.size();
int totalStock = 0;
int lowStock = 0;

for(Product p : list){
    totalStock += p.getQuantity();
    if(p.getQuantity() < 5){
        lowStock++;
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

/* Layout */
body{
    display:flex;
    background:#f4f6f9;
}

/* Sidebar */
.sidebar{
    width:230px;
    height:100vh;
    background:#1e293b;
    color:white;
    position:fixed;
}

.sidebar h2{
    text-align:center;
    padding:20px;
    background:#0f172a;
    letter-spacing:1px;
}

.sidebar a{
    display:block;
    padding:15px 20px;
    color:#cbd5e1;
    text-decoration:none;
    transition:0.3s;
}

.sidebar a:hover{
    background:#334155;
    color:#fff;
}

/* Main Content */
.main{
    margin-left:230px;
    width:100%;
}

/* Topbar */
.topbar{
    background:white;
    padding:15px 20px;
    box-shadow:0 2px 5px rgba(0,0,0,0.1);
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.topbar h3{
    color:#333;
}

/* Cards */
.cards{
    display:flex;
    gap:20px;
    padding:20px;
}

.card{
    flex:1;
    padding:20px;
    border-radius:10px;
    color:white;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

.card h2{
    font-size:28px;
}

.card p{
    margin-top:5px;
    font-size:14px;
}

/* Card Colors */
.blue{ background:#3b82f6; }
.green{ background:#10b981; }
.red{ background:#ef4444; }

/* Welcome */
.welcome{
    padding:20px;
    font-size:18px;
    color:#555;
}
</style>

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Inventory</h2>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="add-product.jsp">Add Product</a>
    <a href="view-products.jsp">View Products</a>
    <a href="logout">Logout</a>
</div>

<!-- Main -->
<div class="main">

    <!-- Topbar -->
    <div class="topbar">
        <h3>Dashboard</h3>
        <span>Welcome Admin</span>
    </div>

    <!-- Cards -->
    <div class="cards">

        <div class="card blue">
            <h2><%=totalProducts%></h2>
            <p>Total Products</p>
        </div>

        <div class="card green">
            <h2><%=totalStock%></h2>
            <p>Total Stock</p>
        </div>

        <div class="card red">
            <h2><%=lowStock%></h2>
            <p>Low Stock Items</p>
        </div>

    </div>

    <!-- Welcome Section -->
    <div class="welcome">
        Welcome to your Inventory Management Dashboard 
    </div>

</div>

</body>
</html>