import type { Request, Response } from 'express';
import * as productService from '../services/productService.js'

export const handleGetAllProducts = async (req: Request, res: Response) => {
    try {
        const products = await productService.getAllProducts();
        res.status(200).json(products);
    } catch (error) {
        res.status(500).json({ message: 'Failed to fetch products.', error});
    }
};

export const handleGetUserProducts = async (req: Request, res: Response) => {
    try {
        const brandId = req.user.brandId;
        if (!brandId) {
            return res.status(401).json({message: '비정상적인 접근입니다.'});
        }
        const products = await productService.getUserProducts(brandId);
        res.status(200).json(products);
    } catch (error) {
        res.status(500).json({ message: `Failed to fetch user's products.`, error});
    }
}