import pool from './database/db.config.js';
import express from 'express';
import userRoutes from './routes/user.routes.js';
import setupRoutes from './routes/setup.routes.js';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use("/users", userRoutes);
app.use("/setup", setupRoutes);
app.get("/", (req, res) => {
    res.send(`{message: "Hello from the API!"}`);
  });
  

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});