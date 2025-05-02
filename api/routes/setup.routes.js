import express from "express";
import {dbSetup} from "../controller/setup.controller.js";

const router = express.Router();

router.get("/", dbSetup);
//router.post("/login", login);

export default router;
