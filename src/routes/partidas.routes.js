import { Router } from 'express'
import partidasController from '../controllers/PartidassController.js'

const partidasRoutes = Router()

const partidasController = new PartidasController()

partidasRoutes.post('/update', partidasController.update)
partidasRoutes.post('/', partidasController.getAll)

module.exports = partidasRoutes