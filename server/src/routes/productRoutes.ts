import { Router } from 'express';
import { handleGetAllProducts, handleGetUserProducts } from '../controllers/productController.js'
import { authenticateToken } from '../midwares/authMiddleware.js';
const router = Router();
router.get('/', handleGetAllProducts);
router.get('/user', authenticateToken, handleGetUserProducts);

export default router;
