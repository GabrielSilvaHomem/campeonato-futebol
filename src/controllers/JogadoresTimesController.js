import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

class JogadoresTimesController {


    async connect(request, response) {

        try {
            const { fk_id_jogadores, fk_id_times } = request.body
            const jogadorTime = await prisma.jogadoresTimes.create({
                data: {
                    fk_id_jogadores: fk_id_jogadores,
                    fk_id_times: fk_id_times
                },
            });
            response.json(jogadorTime)
        } catch (err) {
            return response.status(409).send()
        }
    }

    async createBoth(request, response) {

        try {
            const { nomeJogador, idade, posicao, nacionalidade, nomeTime, ano, pais, tecnico } = request.body
            const jogadorTime = await prisma.jogadoresTimes.create({
                data: {

                    jogadores: {
                        create: {
                            nomeJogador: nomeJogador,
                            idade: idade,
                            posicao: posicao,
                            nacionalidade: nacionalidade,
                        },
                    },


                    times: {
                        create: {
                            nomeTime: nomeTime,
                            ano: ano,
                            pais: pais,
                            tecnico: tecnico,
                        },
                    },


                },

            });
            response.json(jogadorTime)
        } catch (err) {
            return response.status(409).send()
        }
    }

    async delete(request, response) {

        try {
            const { id } = request.body
            const jogadorTime = await prisma.jogadoresTimes.delete({
                where: {
                    id: id,
                },
            });

            response.json(jogadorTime)
        } catch (err) {
            return response.status(409).send()
        }
    }

    async getAll(response) {

        try {
            const jogadorTime = await prisma.jogadoresTimes.findMany({
                include: {
                    times: true,
                    jogadores: true,
                },
            });


            response.json(jogadorTime)
        } catch (err) {
            return response.status(409).send()
        }
    }
}

module.exports = JogadoresTimesController
