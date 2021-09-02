// Permet de verifier si le frontend à l'autorisation d'acceder à notre backend

const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
  try {
    const token = req.headers.authorization.split(' ')[1];
    const decodedToken = jwt.verify(token, process.env.TOKENTEST);
    console.log(decodedToken)
    next();
  } catch {
    res.status(401).json({ 
      error: new Error('Invalid request!')
     
    }); 
  }
};