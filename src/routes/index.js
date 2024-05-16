import {Router} from 'express'
import {jogadoresRoutes} from './jogadores.routes.js'
import {timesRoutes} from './times.routes.js'
import {partidasRoutes} from './partidas.routes.js'
import {jogadoresTimesRoutes} from './jogadoresTimes.routes.js'

const routes = Router()

routes.use('/jogador', jogadoresRoutes)
routes.use('/time', timesRoutes)
routes.use('/partidas', partidasRoutes)
routes.use('/jogadoresTimes', jogadoresTimesRoutes)

module.exports = routes
