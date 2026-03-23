<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>

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
}

.sidebar a{
    display:block;
    padding:15px 20px;
    color:#cbd5e1;
    text-decoration:none;
}

.sidebar a:hover{
    background:#334155;
    color:white;
}

/* Main */
.main{
    margin-left:230px;
    width:100%;
}

/* Topbar */
.topbar{
    background:white;
    padding:15px 20px;
    box-shadow:0 2px 5px rgba(0,0,0,0.1);
}

/* Form Card */
.form-container{
    width:500px;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.form-container h2{
    margin-bottom:20px;
    text-align:center;
}

/* Inputs */
.input-group{
    margin-bottom:15px;
}

.input-group label{
    display:block;
    margin-bottom:5px;
    font-size:14px;
    color:#555;
}

.input-group input{
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:6px;
    outline:none;
    transition:0.3s;
}

.input-group input:focus{
    border-color:#3b82f6;
    box-shadow:0 0 5px rgba(59,130,246,0.5);
}

/* Button */
button{
    width:100%;
    padding:12px;
    border:none;
    background:#3b82f6;
    color:white;
    font-size:16px;
    border-radius:6px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#2563eb;
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
        <h3>Add Product</h3>
    </div>

    <!-- Form -->
    <div class="form-container">

        <h2>Add New Product</h2>

        <form action="product" method="post">

            <input type="hidden" name="action" value="add">

            <div class="input-group">
                <label>Product Name</label>
                <input type="text" name="name" placeholder="Enter product name" required>
            </div>

            <div class="input-group">
                <label>Price</label>
                <input type="number" name="price" placeholder="Enter price" required>
            </div>

            <div class="input-group">
                <label>Quantity</label>
                <input type="number" name="quantity" placeholder="Enter quantity" required>
            </div>

            <div class="input-group">
                <label>Category</label>
                <input type="text" name="category" placeholder="Enter category" required>
            </div>

            <button type="submit">Add Product</button>

        </form>

    </div>

</div>

</body>
</html>