import { Repository } from 'typeorm';
import { City } from '../entities/City';
import { AppDataSource } from '../data-source';

const cityRepository: Repository<City> = AppDataSource.getRepository(City);

export const getAllCities = async (): Promise<City[]> => {
  return cityRepository.find();
};

export const insertCity = async (cityData: { id: number; name: string }): Promise<void> => {
    const existingCity = await cityRepository.findOne({ where: { id: cityData.id } });
  
    if (!existingCity) {
      const newCity = cityRepository.create(cityData);
      await cityRepository.save(newCity);
    }
  };
  