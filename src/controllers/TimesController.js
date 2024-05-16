import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

class TimesController {


    async create(request, response) {
        try {
            const { nome, ano, pais, tecnico } = request.body


            const time = await prisma.times.create({
                data: {
                    nome: nome,
                    ano: ano,
                    pais: pais,
                    tecnico: tecnico,
                },
            });


            response.json(time)
        } catch (err) {
            return response.status(409).send()
        }
    }

    async delete(request, response) {
        try {
            const { id } = request.body
            const time = await prisma.times.delete({
                where: {
                    id: id
                }
            });
            response.json(time)
        } catch (err) {
            return response.status(409).send()
        }
    }
    async getAll(request, response) {
        try {
            const { id } = request.body
            const time = await prisma.times.findMany({
                where: {
                    id: id
                },


                include: {
                    jogadores: true,
                },
            });

            response.json(time)
        } catch (err) {
            return response.status(409).send()
        }
    }
}

module.exports = TimesController
