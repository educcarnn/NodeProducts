import express from 'express';
import {
  listProducts,
  createProduct,
  updateProduct,
  deleteProduct,
} from '../controllers/ProductController';

const router = express.Router();

router.get('/list-products', listProducts);
router.post('/create-product', createProduct);
router.patch('/update-product/:id', updateProduct);
router.delete('/delete-product/:id', deleteProduct);

export default router;
