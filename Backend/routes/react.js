const {createReact, Allreact, getReactbyid, updateReact, deleteReacts} = require("../controllers/react")
const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth")

router.post ("/react",auth, createReact);
router.get("/api/reacts",auth, Allreact);
router.get("/api/react/:reactId",auth, getReactbyid);
router.put("api/react/:reactId",auth, updateReact);
router.delete("/react/:reactId",auth, deleteReacts);

module.exports = router 