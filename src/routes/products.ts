import express from 'express';
import * as ProductController from '../controllers/ProductController';
import * as CityController from '../controllers/CityController';

const router = express.Router();

router.get('/products', ProductController.listProducts);
router.post('/products', ProductController.createProduct);
router.patch('/products/:id', ProductController.updateProduct);
router.delete('/products/:id', ProductController.deleteProduct);

router.get('/sync-cities', CityController.syncCitiesWithIBGE);

export default router;
