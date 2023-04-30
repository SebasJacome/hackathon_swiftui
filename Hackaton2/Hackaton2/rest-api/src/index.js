import express from 'express'
import bankRoutes from './routes/park.routes.js'
import indexRoutes from './routes/index.routes.js'
import cors from 'cors'

import {PORT} from './config.js'

const app = express()

app.use(express.json())
app.use(cors())

app.use('/api', indexRoutes)
app.use(bankRoutes)

app.listen(PORT)
console.log('Escuchando en el puerto', PORT)