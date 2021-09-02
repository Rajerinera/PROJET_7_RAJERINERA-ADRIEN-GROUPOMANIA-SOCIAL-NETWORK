const {createReact, Allreact, getReactbyid, updateReact, deleteReacts} = require("../service/react")

module.exports = {
    // Créer dans la base de données les reactions
    createReact: (req, res) => {
        createReact(req.body, (err, results) => {
            if (err){
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: 'error react'
                })
            }
            return res.status(200).json({
                sucess: 1, 
                data: results,
                message: "react fait"
            })
        })
    },
    // Récuperer tous les données dans la base de donnée
    Allreact: (req, res) => {
        Allreact((err, results) => {
            if(err){
                console.log(err);
                return;
            }
            res.send(results);
        });
    },

    // Récuperer une données précise dans la base de donnée
    getReactbyid:(req, res) => {
        getReactbyid(req.params.reactId, (err, rows) => {
            if(err){
                console.log(err)
                return
            }
            console.log("react id réusssis" + rows)
            res.json(rows);
        })
    },

    // Modifier une donnée dans la base de donnée
    updateReact: (req, res) => {
        updateReact(req.body, (err, results) => {
            if (err){
                console.log(err);
                return;
            }
            return res.json({
                sucess: 1, 
                message: "update react sucess"
            })
        })
    },

    //Supprimer une donnée dans la base de donnée
    deleteReacts: (req, res) => {
        deleteReacts(req.params.reactId, (err, results) => {
            if (err){
                console.log(err)
                return
            }
            res.json({
                sucess: 1,
                message: "react delete"
            })
        });
    }
} 