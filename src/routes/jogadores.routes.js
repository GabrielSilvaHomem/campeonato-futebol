import { Router } from 'express'
import jogadoresController from '../controllers/JogadoresController.js'

const jogadoresRoutes = Router()

const jogadoresController = new JogadoresController()

jogadoresRoutes.post('/create', jogadoresController.create)
jogadoresRoutes.post('/delete', jogadoresController.delete)
jogadoresRoutes.post('/', jogadoresController.getAll)

module.exports = jogadoresRoutes