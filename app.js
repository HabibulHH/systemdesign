const { Pool } = require("pg");
const casual = require("casual");
// CJS
const { faker } = require("@faker-js/faker");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "",
  password: "",
  port: 5432, // Default PostgreSQL port
});

// Function to generate random names and insert into the database
async function generateAndInsertNames() {
  const client = await pool.connect();

  try {
    for (let i = 0; i < 10000000; i++) {
      const name = casual.full_name;
      const age = faker.datatype.number({ min: 18, max: 25 });

      const query = "INSERT INTO student (name, age) VALUES($1, $2)";
      const values = [name, age];

      await client.query(query, values);
    }

    console.log("Names inserted successfully.");
  } catch (error) {
    console.error("Error inserting names:", error);
  } finally {
    client.release(); // Releasing the client back to the pool
  }
}

generateAndInsertNames();
