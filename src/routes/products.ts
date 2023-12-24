import express from 'express';
import * as ProductController from '../controllers/ProductController';
import * as ExtraController from '../controllers/CityController';

const router = express.Router();

router.get('/products', ProductController.listProducts);
router.post('/products', ProductController.createProduct);
router.patch('/products/:id', ProductController.updateProduct);
router.delete('/products/:id', ProductController.deleteProduct);

router.post('/sync-cities', ExtraController.syncCitiesWithIBGE);

export default router;
