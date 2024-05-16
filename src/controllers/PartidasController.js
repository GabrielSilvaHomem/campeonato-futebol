import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

class PartidasController {


  async update(request, response) {
    try {
      const { id, data, local, placar } = request.body
      const partida = await prisma.partidas.update({
        where: {
          id: id
        },
        data: {
          data: data,
          local: local,
          placar: placar

        }
      });
      response.json(partida)
    } catch (err) {
      return response.status(409).send()
    }
  }

  async getAll(request, response) {
    try {
      const { id } = request.body
      const partida = await prisma.partidas.findUnique({
        where: {
          id: id
        },
        include: {
          timeCasa: true,
          timeVisitante: true
        }
      });
      return response.json(partida)
    } catch (err) {
      return response.status(409).send()
    }
  }
}

module.exports = PartidasController