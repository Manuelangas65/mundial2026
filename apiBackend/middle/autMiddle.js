const jwt = require('jsonwebtoken');


const CLAVE = 'baduedito_eliza';
const verifyToken = (req, res, next) => {
    const authHeader = req.headers['autorizacion'];

    if(!authHeader){
        return res.status(403).json({message:'dame tu token'});
    }
    const token = authHeader.split(' ')[1];

    try {
        const decoded = jwt.verify(token, SECRET_KEY);
        req.user = decoded;
        next();
    } catch (error) {
        return res.status(401).json({ message: 'tu token pedorro no sirve' });
    }

};

module.exports = verifyToken;