const {getUsersById, getUsers, updateUser, deleteUser} = require ("../controllers/user");
const express = require("express");
const router = express.Router(); 
const auth = require("../middleware/auth")

router.get("/users",auth, getUsers); // route pour récuperer nos données user
router.get("/:id",auth, getUsersById); // route pour récuperer un user précis
router.patch("/:id",auth, updateUser); // route pour modifier un user 
router.delete("/:id",auth, deleteUser); // route pour supprimer un user
 
module.exports = router; 