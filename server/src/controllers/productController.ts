import type { Request, Response } from 'express';
import * as productService from '../services/productService.js'

export const handleGetAllProducts = async (req: Request, res: Response) => {
    try {
        const products = await productService.getAllProducts();
        res.status(200).json(products);
    } catch (error) {
        res.status(500).json({ message: 'Failed to fetch products.', error});
    }
}