const jwt = require('jsonwebtoken');


const USER = {
    username: 'admin',
    password: '123'
}

const CLAVE = 'baduedito_eliza';

const login = (req, res) => {
    const {username, password} = req.body;

    if(username == USER.username && password == USER.password){
        const token = jwt.sign(
            {username},
            CLAVE, 
            {expiresIn: '2h'}
        );

        return res.json({token});
    }

    return res.status(401).json({message: 'esta maaal'});
};

module.exports = {login};