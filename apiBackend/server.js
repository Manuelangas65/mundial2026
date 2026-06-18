const express = require('express');
const cors = require('cors');

const { obtenerPartidos, actualizarMarcador } = require('./controllers/partidosController');

const app = express();
const PORT = 3000;

app.use(cors({
    origin: '*'
}));

app.use(express.json());

app.get('/partidos', obtenerPartidos);
app.put('/partidos/:id', actualizarMarcador);

app.listen(PORT, () => {
    console.log(`servidor corriendo en el puerto ${PORT}`);
});