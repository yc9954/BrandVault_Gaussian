import { Router } from 'express';
import { handleGetAllProducts } from '../controllers/productController.js'

const router = Router();
router.get('/', handleGetAllProducts);

export default router;
