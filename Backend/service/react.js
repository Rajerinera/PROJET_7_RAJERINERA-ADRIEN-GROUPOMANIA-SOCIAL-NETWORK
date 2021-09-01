const pool = require('../connectiondb/db');
const mysql = require("mysql");

module.exports = {

        createReact:(newReact, result) =>{
            pool.query(
                'INSERT into `react`(`postReact`, `userReact`, iduserReact, idReactComment) VALUES(?,?,?,?)',[
                    newReact.postReact,
                    newReact.userReact,
                    newReact.iduserReact,
                    newReact.idReactComment,
                ],
                (error, results, fields) => {
                    if(error){
                        console.log( newReact.post_react)
                        result(error);
                    } 
                    return result(null, results) 
                   
                }
            )
        },

        Allreact: callback => {
            pool.query( 'SELECT * FROM react', [],
                (error, results, fields) => {
                    if(error){
                        return callback (error);
                    }
                    callback(null, results)
                }
            );
        },

        getReactbyid: (idreact1, result) => {
            pool.query("SELECT * FROM react WHERE iduserReact = ?",
            [idreact1],
            (error, resultat) => {
                if (error){
                    console.log("error", error); 
                    result(error, null);
                    return;
                }
                if(resultat.length) {
                    console.log("react found", resultat)
                    result (null, resultat);
                    return;
                }
                result(resultat[0], null);
            } 
            );
            console.log(idreact1)
        },

        updateReact: (react, idrea, callback) => {
            pool.query(`UPDATE react SET post_react = ? WHERE idreact = ?`,
            [react.post_react, idrea],
            (error, results, fields) => {
                if(error){
                    console.log(error)
                    callback(error)
                }
                    return callback(null, results);
            }
            )
        },
        deleteReacts: (react, callback) => {
            pool.query(
                `DELETE FROM react WHERE idreact = ?` ,[react],
                (error, results, fields) => {
                    if (error) {
                        console.log(react)
                        return callback(error);
                       
                    }
                    callback(null, results[0]);
                }
            )
        }

}