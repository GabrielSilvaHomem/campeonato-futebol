import { Router } from 'express'
import timesController from '../controllers/TimesController.js'

const timesRoutes = Router()

const timesController = new TimesController()

timesRoutes.post('/create', timesController.create)
timesRoutes.post('/delete', timesController.delete)

module.exports = timesRoutes