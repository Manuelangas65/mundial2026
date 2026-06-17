const pool = require('./config/db');//importamos db.js para usar la conexion de ahí 
const {obtenerPartidos} = require('./controllers/partidosController');//para poder usar la funcion de pedir los partideishons
const express = require('express');
const app = express();
const PORT = 3000;

app.get('/partidos', obtenerPartidos);

app.listen(PORT, () => {
    console.log(`servidor corriendo en el puerto ${PORT}`)
});
