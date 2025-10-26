import type { Request, Response } from 'express';
import "dotenv/config";
import cors from "cors";
import express from 'express';
import http from 'http';
import productRoutes from './routes/productRoutes.js';

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use("/api/products", productRoutes);

app.listen(port, () => {
  console.log(`server is running on port ${port}`);
});