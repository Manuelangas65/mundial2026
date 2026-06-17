// Aqui se crea la conexión con la base de datos 
// mediante la infromacion q nos dio Saldaña 
const {Pool} = require('pg'); //this is la sintaxis para importar vale? y el pg sirve como traductor entre node y la DB
//el pool nos sirve para tener varias conexiones listas para usar en lugar de hacer una terminarla y hacer otra y terminarla y asi 

const pool = new Pool({//for example aqui estamos creando una conexión con la BD
    host: '31.97.102.106',
    port: 5432,
    user: 'administrador',
    password: 'Penjamo-123',
    database: 'mundial_2026'
});

module.exports = pool;//esto permite que importando este archivo en ptros archivos, ese archivo pueda usar esta conexión



