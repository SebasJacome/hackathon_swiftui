import {Router} from 'express'
import {
    getUsuario, createUsuario,
    getParkingLots, getParkingLot, createParkingLot,
    getSolicitud, createSolicitud,
    getResena, createResena
} 
    from '../controllers/park.controllers.js'

const router = Router()

router.get('/usuarios/:correo/:contrasena', getUsuario)

router.post('/usuarios', createUsuario)

router.get('/estacionamientos', getParkingLots)

router.get('/estacionamientos/:id', getParkingLot)

router.post('/estacionamientos', createParkingLot)

router.get('/solicitudes/:id_estacionamiento', getSolicitud)

router.post('/solicitudes', createSolicitud)

router.get('/resenas/:id_estacionamiento', getResena)

router.post('/resenas', createResena)

export default router