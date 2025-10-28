import Router from 'express'
import { authenticateToken } from '../midwares/authMiddleware.js';
import * as projectController from '../controllers/projectController.js'

const router = Router();
router.get('/', authenticateToken, projectController.handleGetUserProjects)

export default router;