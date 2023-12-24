
import { Repository } from 'typeorm';
import { City } from '../entities/City';
import { AppDataSource } from '../data-source';

const cityRepository: Repository<City> = AppDataSource.getRepository(City);

export const insertCity = async (cityData: { id: number; name: string }): Promise<void> => {
  const existingCity = await cityRepository.findOne({ where: { name: cityData.name } });

  if (!existingCity) {
    const newCity = cityRepository.create(cityData);
    await cityRepository.save(newCity);
  }
  // Se o nome já existir, o código simplesmente continuará sem preencher na tabela.
};
