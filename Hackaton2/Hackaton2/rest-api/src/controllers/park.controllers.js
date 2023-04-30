import {pool} from '../db.js'

export const getUsuario = async (req, res) => {
    const [rows] = await pool.query('select * from usuarios where correo = ? and contrasena = ?', [req.params.correo, req.params.contrasena])
    res.send(rows[0])
}

export const createUsuario = async (req, res) => {
    const {nombre, correo, contrasena} = req.body
    const [rows] = await pool.query('insert into usuarios (nombre, correo, contrasena) values (?, ?, ?)', [nombre, correo, contrasena])
}

export const getParkingLots = async (req, res) => {
    const [rows] = await pool.query('select * from estacionamientos')
    res.send(rows)
}

export const getParkingLot = async (req, res) => {
    const [rows] = await pool.query('select * from estacionamientos where id = ?', [req.params.id])
    res.send(rows[0])
}

export const createParkingLot = async (req, res) => {
    const {name, address, cLatitud, cLongitud} = req.body
    const [rows] = await pool.query('insert into estacionamientos (nombre, direccion, cLatitud, cLongitud) values (?, ?, ?, ?)', [name, address, cLatitud, cLongitud])
}

export const getSolicitud = async (req, res) => {
    const [rows] = await pool.query('select * from solicitudes where id_estacionamiento = ? order by fecha', [req.params.id_estacionamiento])
    res.send(rows[0])
}

export const createSolicitud = async (req, res) => {
    const {id_estacionamiento, id_usuario, fecha, placas, modelo, fpago} = req.body
    const [rows] = await pool.query('insert into solicitud (id_usuario, id_estacionamiento, fecha, placasVehiculo, modeloVehiculo, formaDePago) values (?, ?, ?, ?, ?, ?)', [id_usuario, id_estacionamiento,fecha, placas, modelo, fpago])
}

export const getResena = async (req, res) => {
    const [rows] = await pool.query('select * from resenas where id_estacionamiento = ?', [req.params.id_estacionamiento])
    res.send(rows[0])
}

export const createResena = async (req, res) => {
    const {id_estacionamiento, calificacion, comentario} = req.body
    const [rows] = await pool.query('insert into resenas (id_estacionamiento, calificacion, comentario) values (?, ?, ?)', [id_estacionamiento, calificacion, comentario])
}