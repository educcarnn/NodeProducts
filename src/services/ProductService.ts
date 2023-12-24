import { Repository } from "typeorm";
import { Product } from "../entities/Product";
import { AppDataSource } from "../data-source";

const productRepository: Repository<Product> =
  AppDataSource.getRepository(Product);

export const getAllProducts = async (): Promise<Product[]> => {
  return productRepository.find();
};

export const createProduct = async (
  productData: Partial<Product>
): Promise<Product> => {
  const product = productRepository.create(productData);
  return productRepository.save(product);
};

export const updateProduct = async (productId: number, productData: Partial<Product>): Promise<Product | undefined> => {
  try {
    const existingProduct = await productRepository.findOne({ where: { id: productId } });
    
    if (existingProduct) {
      productRepository.merge(existingProduct, productData);
      return productRepository.save(existingProduct);
    } else {
      // Produto não encontrado
      return undefined;
    }
  } catch (error) {
    // Lidar com erros de banco de dados ou outras exceções
    return undefined;
  }
};

export const deleteProduct = async (productId: number): Promise<boolean> => {
  try {
    await productRepository.softDelete(productId);
    return true;
  } catch (error) {
    return false;
  }
};
