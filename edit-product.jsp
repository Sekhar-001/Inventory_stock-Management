<%@ page import="com.inventory.dao.ProductDAO,com.inventory.model.Product" %>

<%
String id = request.getParameter("id");
ProductDAO dao = new ProductDAO();
Product p = dao.getProductById(id);
%>

<%@ include file="navbar.jsp" %>

<style>

/* Form Card */
.form-container{
    width:500px;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
    animation:fadeIn 0.5s ease;
}

.form-container h2{
    margin-bottom:20px;
    text-align:center;
    color:#1e293b;
}

/* Input Group */
.input-group{
    margin-bottom:18px;
}

.input-group label{
    display:block;
    margin-bottom:6px;
    font-size:14px;
    color:#555;
}

.input-group input{
    width:100%;
    padding:11px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
    transition:0.3s;
    font-size:14px;
}

.input-group input:focus{
    border-color:#3b82f6;
    box-shadow:0 0 6px rgba(59,130,246,0.4);
}

/* Button */
button{
    width:100%;
    padding:12px;
    border:none;
    background:#10b981;
    color:white;
    font-size:16px;
    border-radius:8px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#059669;
}

/* Back Button */
.back{
    display:block;
    margin-top:15px;
    text-align:center;
    text-decoration:none;
    color:#3b82f6;
    font-size:14px;
}

.back:hover{
    text-decoration:underline;
}

/* Animation */
@keyframes fadeIn{
    from{
        opacity:0;
        transform:translateY(20px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

</style>

<!-- Content -->
<div class="form-container">

    <h2>Edit Product</h2>

    <form action="product" method="post">

        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%=p.getId()%>">

        <div class="input-group">
            <label>Product Name</label>
            <input type="text" name="name" value="<%=p.getName()%>" required>
        </div>

        <div class="input-group">
            <label>Price</label>
            <input type="number" name="price" value="<%=p.getPrice()%>" required>
        </div>

        <div class="input-group">
            <label>Quantity</label>
            <input type="number" name="quantity" value="<%=p.getQuantity()%>" required>
        </div>

        <div class="input-group">
            <label>Category</label>
            <input type="text" name="category" value="<%=p.getCategory()%>" required>
        </div>

        <button type="submit">Update Product</button>

    </form>

    <a href="view-products.jsp" class="back">Back to Products</a>

</div>

<!-- CLOSE TAGS FROM NAVBAR -->
</div>
</div>

</body>
</html>