package com.inventory.config;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBConnection {

    private static final String CONNECTION_STRING = "MongoClients.create(\"mongodb+srv://sekhar001:1234@sekhar.hynz241.mongodb.net/inventoryDB?retryWrites=true&w=majority\");";
    private static final String DATABASE_NAME = "inventoryDB";

    private static MongoClient mongoClient;
    private static MongoDatabase database;

    // =========================
    // GET DATABASE (Singleton)
    // =========================
    public static MongoDatabase getDatabase() {

        try {
            if (database == null) {

                mongoClient = MongoClients.create(CONNECTION_STRING);
                database = mongoClient.getDatabase(DATABASE_NAME);

                System.out.println("✅ MongoDB Connected Successfully");
            }

        } catch (Exception e) {
            System.err.println("❌ MongoDB Connection Failed");
            e.printStackTrace();
        }

        return database;
    }

    // =========================
    // CLOSE CONNECTION (OPTIONAL)
    // =========================
    public static void closeConnection() {
        try {
            if (mongoClient != null) {
                mongoClient.close();
                System.out.println("🔌 MongoDB Connection Closed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
