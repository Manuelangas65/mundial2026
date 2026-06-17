const express = require('express');
const cors = require('cors');

const { obtenerPartidos } = require('./controllers/partidosController');

const app = express();
const PORT = 3000;

app.use(cors({
    origin: '*'
}));

app.use(express.json());

app.get('/partidos', obtenerPartidos);

app.listen(PORT, () => {
    console.log(`servidor corriendo en el puerto ${PORT}`);
});