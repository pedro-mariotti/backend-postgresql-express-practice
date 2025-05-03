import express from "express";
import { register, login, getAllUsers } from "../controller/user.controller.js";

const router = express.Router();

router.post("/register", register);
router.post("/login", login);
router.get("/", getAllUsers);

export default router;
