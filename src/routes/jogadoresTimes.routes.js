import { Router } from 'express'
import jogadoresTimesController from '../controllers/JogadoresTimesController.js'

const jogadoresTimesRoutes = Router()

const jogadoresTimesController = new JogadoresTimesController()

jogadoresTimesRoutes.post('/connect', jogadoresTimesController.connect)
jogadoresTimesRoutes.post('/createBoth', jogadoresTimesController.createBoth)
jogadoresTimesRoutes.post('/delete', jogadoresTimesController.delete)
jogadoresTimesRoutes.post('/', jogadoresTimesController.getAll)

module.exports = jogadoresTimesRoutes