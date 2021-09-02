const {createReact, Allreact, getReactbyid, updateReact, deleteReacts} = require("../controllers/react")
const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth")

router.post ("/react",auth, createReact);// route pour créer des reactions sur notre application
router.get("/api/reacts",auth, Allreact); // route pour récuperer des reactions sur notre application
router.get("/api/react/:reactId",auth, getReactbyid); // route pour récuperer une donnée précise de notre application
router.put("api/react/:reactId",auth, updateReact); // route pour modifier nos reactions
router.delete("/react/:reactId",auth, deleteReacts); // route pour supprimer nos reactions

module.exports = router 