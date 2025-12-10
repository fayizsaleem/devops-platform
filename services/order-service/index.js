const express = require("express");
const app = express();

app.use(express.json());

const products = [
  { id: 1, name: "Laptop" },
  { id: 2, name: "Phone" },
];

app.get("/products", (req, res) => {
  res.json(products);
});

app.get("/health", (req, res) => {
  res.send("OK");
});

const PORT = 4000;
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Order service running on port ${PORT}`);
});
