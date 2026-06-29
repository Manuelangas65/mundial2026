const express = require('express');
const cors = require('cors');

const { obtenerPartidos, actualizarMarcador } = require('./controllers/partidosController');
const verifyToken = require('./middle/autMiddle'); 

const app = express();
const PORT = 3000;

app.use(cors({
    origin: '*'
}));

app.use(express.json());

app.use('/aut', require('./routes/autRoutes'));//rutita para la autenticación
app.get('/partidos', verifyToken, obtenerPartidos);//agregamos que se requiera la verificación
app.put('/partidos/:id',verifyToken, actualizarMarcador);

app.listen(PORT, () => {
    console.log(`servidor corriendo en el puerto ${PORT}`);
});