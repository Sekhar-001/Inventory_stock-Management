package com.inventory.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import com.inventory.dao.ProductDAO;
import com.inventory.model.Product;

import java.io.IOException;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    ProductDAO dao = new ProductDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {

            Product p = new Product();
            p.setName(req.getParameter("name"));
            p.setPrice(Double.parseDouble(req.getParameter("price")));
            p.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            p.setCategory(req.getParameter("category"));

            dao.addProduct(p);

        } else if ("update".equals(action)) {

            Product p = new Product();
            p.setId(req.getParameter("id"));
            p.setName(req.getParameter("name"));
            p.setPrice(Double.parseDouble(req.getParameter("price")));
            p.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            p.setCategory(req.getParameter("category"));

            dao.updateProduct(p);
        }

        res.sendRedirect("view-products.jsp");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {

        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            dao.deleteProduct(req.getParameter("id"));
        }

        res.sendRedirect("view-products.jsp");
    }
}