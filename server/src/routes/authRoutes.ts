import { Router } from 'express'
import { handleCreatorLogin, handleLogout } from '../controllers/authController.js';

const router = Router();

router.post('/login/creator', handleCreatorLogin);
// router.post('/login/platform', handlePlatformUserLogin);
router.post('/logout', handleLogout);

export default router;