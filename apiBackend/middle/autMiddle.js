const jwt = require('jsonwebtoken');

const CLAVE = 'baduedito_eliza';

const verifyToken = (req, res, next) => {
    // 1. Corregido a 'authorization' (estándar internacional de los navegadores)
    const authHeader = req.headers['authorization']; 

    if(!authHeader){
        return res.status(403).json({message:'dame tu token'});
    }
    
    const token = authHeader.split(' ')[1];

    try {
        // 2. Corregido para usar la variable 'CLAVE' que declaraste arriba
        const decoded = jwt.verify(token, CLAVE); 
        req.user = decoded;
        next();
    } catch (error) {
        return res.status(401).json({ message: 'tu token pedorro no sirve' });
    }
};

module.exports = verifyToken;