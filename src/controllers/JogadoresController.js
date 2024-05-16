import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

class JogadoresController {


  async create(request, response) {

    const { nome, idade, posicao, nacionalidade, idTime } = request.body

    try {
      const jogador = await prisma.jogadores.create({
        data: {
          nome: nome,
          idade: idade,
          posicao: posicao,
          nacionalidade: nacionalidade,
          times: {
            create: {
              time: {
                connect: {
                  idTime: idTime
                },
              },
            },
          },
        },
      });
      response.json(jogador)
    } catch (err) {
      return response.status(409).send()
    }
  }

  async delete(request, response) {
    try {
      const { id } = request.body
      const jogador = await prisma.jogadores.delete({
        where: {
          id: id
        }
      });
      response.json(jogador)
    } catch (err) {
      return response.status(409).send()
    }
  }

  async getAll(request, response) {
    try {
      const { id } = request.body
      const jogador = await prisma.jogadores.findMany({
        where: {
          id: id
        },


        include: {
          times: true,
        },
      });

      response.json(jogador)
    } catch (err) {
      return response.status(409).send()
    }
  }

}

module.exports = JogadoresController
