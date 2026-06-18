const pool = require('../config/db');

const obtenerPartidos = async (req, res) => {//this function es para pedirle los partidos a postgres
    //aqui pondremos un catch como nos enseño valdi, para atrapar los posibles errores que haya
    try {
        const resultado = await pool.query(
            //toda esta consulta es lo que la libreria pg entiende pero node no, entonces pg se lo lleva a postgres
        `SELECT 
            p.id_partido,
            e1.nombre_equipo AS equipo1,
            e2.nombre_equipo AS equipo2,
            p.goles_e1,
            p.goles_e2,
            p.fecha
        FROM partidos p
        INNER JOIN equipos e1
            ON p.id_equipo1 = e1.id_equipo
        INNER JOIN equipos e2
            ON p.id_equipo2 = e2.id_equipo`
        );//query ejecuta el SQL
        res.json(resultado.rows);//con el .rows le decimos q nomas nos de las filas no queremos cosas extravagantes
    }
    catch(error){
        console.error(error);
    }
};


const actualizarMarcador = async(req, res) =>{
    try{
        const {id} = req.params;
        const {goles_e1, goles_e2} = req.body;

        await pool.query(
            `UPDATE partidos
            SET goles_e1 = $1,
                goles_e2 = $2
            WHERE id_partido = $3`,
            [goles_e1, goles_e2, id]
        );

        res.json({
            mensaje:'Marcador actualizado correctamente'
        });
    
    }
    catch(error){
        console.error(error);
        res.status(500).json({
            mensaje:'Error al actualizar el marcador'
        });

    }

};

module.exports = {
    obtenerPartidos,
    actualizarMarcador
}; 