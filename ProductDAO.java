package com.inventory.dao;

import com.inventory.config.MongoDBConnection;
import com.inventory.model.Product;
import com.mongodb.client.*;

import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private MongoCollection<Document> collection;

    public ProductDAO() {
        collection = MongoDBConnection
                .getDatabase()
                .getCollection("products");
    }

    // =========================
    // ADD PRODUCT
    // =========================
    public boolean addProduct(Product p) {
        try {
            Document doc = mapToDocument(p);
            collection.insertOne(doc);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // GET ALL PRODUCTS
    // =========================
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();

        try {
            FindIterable<Document> docs = collection.find();

            for (Document doc : docs) {
                list.add(mapToProduct(doc));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // =========================
    // GET PRODUCT BY ID
    // =========================
    public Product getProductById(String id) {

        try {
            Document doc = collection
                    .find(new Document("_id", new ObjectId(id)))
                    .first();

            if (doc != null) {
                return mapToProduct(doc);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // =========================
    // UPDATE PRODUCT
    // =========================
    public boolean updateProduct(Product p) {

        try {
            Document update = new Document("$set", mapToDocument(p));

            collection.updateOne(
                    new Document("_id", new ObjectId(p.getId())),
                    update
            );

            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // DELETE PRODUCT
    // =========================
    public boolean deleteProduct(String id) {

        try {
            collection.deleteOne(new Document("_id", new ObjectId(id)));
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // =========================
    // MAPPING METHODS (IMPORTANT 🔥)
    // =========================

    private Document mapToDocument(Product p) {
        return new Document("name", p.getName())
                .append("price", p.getPrice())
                .append("quantity", p.getQuantity())
                .append("category", p.getCategory());
    }

    private Product mapToProduct(Document doc) {

        Product p = new Product();

        p.setId(doc.getObjectId("_id").toString());
        p.setName(doc.getString("name"));

        // Safe conversions
        p.setPrice(doc.get("price") != null ? doc.getDouble("price") : 0.0);
        p.setQuantity(doc.get("quantity") != null ? doc.getInteger("quantity") : 0);
        p.setCategory(doc.getString("category"));

        return p;
    }
 // =========================
 // SEARCH PRODUCTS (BY NAME)
 // =========================
 public List<Product> searchProducts(String keyword) {

     List<Product> list = new ArrayList<>();

     try {
         Document query = new Document("name",
                 new Document("$regex", keyword)
                         .append("$options", "i")); // case-insensitive

         FindIterable<Document> docs = collection.find(query);

         for (Document doc : docs) {
             list.add(mapToProduct(doc));
         }

     } catch (Exception e) {
         e.printStackTrace();
     }

     return list;
 }
    
}