

export const dbSetup = async () => {
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
}