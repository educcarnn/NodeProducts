import { Request, Response } from 'express';
import axios from 'axios';
import * as CityService from '../services/CityService';

export const syncCitiesWithIBGE = async (_req: Request, res: Response): Promise<void> => {
  try {
    const response = await axios.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/33/municipios');
    const cities = response.data;

    for (const city of cities) {
      try {
        await CityService.insertCity({ id: city.id, name: city.nome });
      } catch (error) {
        // Se um erro ocorrer durante a inserção devido a um nome já existente, você pode tratá-lo aqui.
        console.error(`Erro ao inserir cidade ${city.nome}`);
      }
    }

    res.json({ message: 'Cidades sincronizadas com sucesso.' });
  } catch (error: any) {
    res.status(500).json({ error: 'Erro ao sincronizar cidades', details: error.message });
  }
};