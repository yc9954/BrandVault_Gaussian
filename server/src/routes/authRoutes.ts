import { Router } from 'express'
import { handleCreatorLogin, handleBrandLogin, handleLogout, } from '../controllers/authController.js';

const router = Router();

router.post('/login/creator', handleCreatorLogin);
router.post('/login/brand', handleBrandLogin);
router.post('/logout', handleLogout);

export default router;