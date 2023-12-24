import express from "express";
import products from "../routes/products";

const router = express.Router();
module.exports = router;

router.use("/", products);

export default router;
