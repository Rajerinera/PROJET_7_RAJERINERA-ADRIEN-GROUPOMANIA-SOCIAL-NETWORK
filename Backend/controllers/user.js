const { genSaltSync, hashSync } = require("bcrypt");
const { getUsers, getUsersById, updateUser, deleteUser } = require("../service/user");

module.exports = {
    // récuperer un user précis dans la base de donnée
    getUsersById: (req, res) => {
        getUsersById(req.params.id, (err, rows) => {
            if (err) {
                console.log(err)
                return
            }

            res.json(rows);
        })

    },
    // récuperer toute les données dans la base de donnée
    getUsers: (req, res) => {
        getUsers((err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            return res.json({
                success: 1,
                data: results,
            });
        });
    },

    // Modifier les données user dans la base de données
    updateUser: (req, res) => {
        if (!req.body) {
            res.status(400).send({
                message: "probleme"
            });
        }
        updateUser(req.body, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            return res.json({
                sucess: 1,
                message: "updated sucess",
            })
        })
    },

    // Supprimer un élément dans la base de donnée
    deleteUser: (req, res) => {
        deleteUser(req.params.id, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    sucess: 0,
                    message: 'delete failed'
                }); 
            }
            return res.json({ 
                sucess: 1,
                message: 'user delete sucess' 
            });
        })
    }

};