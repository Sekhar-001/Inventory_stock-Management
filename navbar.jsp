<!DOCTYPE html>
<html>
<head>

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
    background:#f1f5f9;
}

/* Sidebar */
.sidebar{
    width:240px;
    height:100vh;
    background:linear-gradient(180deg,#0f172a,#1e293b);
    color:white;
    position:fixed;
    display:flex;
    flex-direction:column;
}

/* Logo */
.sidebar .logo{
    padding:20px;
    text-align:center;
    font-size:20px;
    font-weight:bold;
    background:#020617;
    letter-spacing:1px;
}

/* Menu */
.sidebar a{
    padding:15px 20px;
    text-decoration:none;
    color:#cbd5f5;
    display:flex;
    align-items:center;
    gap:10px;
    transition:0.3s;
    font-size:15px;
}

.sidebar a:hover{
    background:#334155;
    color:#fff;
    padding-left:25px;
}

/* Active Link */
.sidebar a.active{
    background:#3b82f6;
    color:white;
}

/* Bottom Logout */
.sidebar .bottom{
    margin-top:auto;
}

/* Main */
.main{
    margin-left:240px;
    width:100%;
}

/* Topbar */
.topbar{
    background:white;
    padding:15px 25px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 2px 8px rgba(0,0,0,0.05);
}

/* Title */
.topbar h3{
    color:#1e293b;
}

/* User Info */
.user{
    font-size:14px;
    color:#555;
}

/* Content Wrapper */
.content{
    padding:20px;
}
</style>

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">

    <div class="logo">Inventory</div>

    <a href="dashboard.jsp" class="active"> Dashboard</a>
    <a href="add-product.jsp"> Add Product</a>
    <a href="view-products.jsp"> View Products</a>

    <div class="bottom">
        <a href="logout"> Logout</a>
    </div>

</div>

<!-- Main -->
<div class="main">

    <!-- Topbar -->
    <div class="topbar">
        <h3>Admin Panel</h3>
        <div class="user">Welcome, Admin</div>
    </div>

    <!-- Content Start -->
    <div class="content">