const {createComment, AllComment, getCommentById, updateComment, deleteComment} = require('../controllers/comment');
const multer = require('../middleware/multer-config');
const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth")




router.post("/comment",auth,multer, createComment); // Route pour faire appel à la création du commentaire  
router.get("/api/comments",auth, AllComment); // Route pour récuperer notre api 
router.get("/api/comment/:commentId",auth, getCommentById); // Route pour récuperer des données précises de notre api
router.put("/api/comment/:commentId",auth,multer, updateComment); // Route permettant de modifier nos commentaires
router.delete("/api/comment/:commentId",auth, deleteComment); // Route permettant de supprimer nos commentaires

module.exports = router 