import pool from './database/db.config.js';
import express from 'express';
import userRoutes from './routes/user.routes.js';

const app = express();
const PORT = process.env.PORT || 3000;

app.use("/users", userRoutes);
app.get("/", (req, res) => {
    res.send(`{message: "Hello from the API!"}`);
  });
  
app.get("/setup", async (req, res) => {
    try {
        const createTableQuery = `
            CREATE TABLE IF NOT EXISTS users (
                id SERIAL PRIMARY KEY,
                username VARCHAR(50) NOT NULL,
                password VARCHAR(255) NOT NULL,
                email VARCHAR(100) NOT NULL
            )
        `;
        await pool.query(createTableQuery);
        res.send("Database setup complete");
    } catch (error) {
        console.error("Error setting up database:", error);
        res.status(500).send("Error setting up database");
    }
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});