import { Request, Response } from 'express';
import * as ProductService from '../services/ProductService';

export const listProducts = async (req: Request, res: Response): Promise<void> => {
  try {
    const products = await ProductService.getAllProducts();
    res.json(products);
  } catch (error: any) {
    res.status(500).json({ error: 'Erro ao buscar todos os produtos', details: error.message });
  }
};

export const createProduct = async (req: Request, res: Response): Promise<void> => {
  const productData = req.body;

  try {
    const newProduct = await ProductService.createProduct(productData);
    res.status(201).json(newProduct);
  } catch (error: any) {
    res.status(500).json({ error: 'Erro ao criar produto', details: error.message });
  }
};

export const updateProduct = async (req: Request, res: Response): Promise<void> => {
    const productId = parseInt(req.params.id, 10); 
    const productData = req.body;
  
    try {
      const updatedProduct = await ProductService.updateProduct(productId, productData);
      if (updatedProduct) {
        res.json(updatedProduct);
      } else {
        res.status(404).json({ message: 'Produto não encontrado' });
      }
    } catch (error: any) {
      res.status(500).json({ error: 'Erro ao atualizar produto', details: error.message });
    }
  };

  export const deleteProduct = async (req: Request, res: Response): Promise<void> => {
    const productId = parseInt(req.params.id, 10); // Ou Number(req.params.id)
  
    try {
      const success = await ProductService.deleteProduct(productId);
      if (success) {
        res.json({ message: 'Produto excluído com sucesso' });
      } else {
        res.status(404).json({ message: 'Produto não encontrado' });
      }
    } catch (error: any) {
      res.status(500).json({ error: 'Erro ao excluir produto', details: error.message });
    }
  };