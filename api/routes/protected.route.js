import express from 'express';
import protectedController from '../controller/protected.controller.js';
import verifyToken from '../middleware/jwt.token.middleware.js';

const router = express.Router();

router.get('/', verifyToken, protectedController.protectedExampleService) 

export default router;