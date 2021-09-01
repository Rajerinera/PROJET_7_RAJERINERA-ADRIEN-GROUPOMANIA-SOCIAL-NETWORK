import Vuex from "vuex";
import axios from "axios";

export default new Vuex.Store({
  state: {
    user: {
      iduser: "NC",
      first_name: "NC",
      name: "NC",
      job: "NC",
      email: "NC",
      password: "NC",
      admin: false,
    },
    comment: {
      idcomment: "NC",
      idcom: "NC",
      title: "NC",
      content: "NC",
      image: "NC",
    },
  },
  mutations: {
    userInfo(state, [iduser, first_name, name, job, email, password, admin]) {
      (state.user.iduser = iduser),
        (state.user.first_name = first_name),
        (state.user.name = name),
        (state.user.job = job);
      (state.user.email = email), (state.user.password = password);
      state.user.admin = admin;
    },
    /*commentInfo(state, [idcomment, idcom, title, content, image]) {
        state.comment.idcomment = idcomment,
        state.comment.idcom = idcom,
        state.comment.title = title,
        state.comment.content = content,
        state.comment.image= image
    }*/
  },
  actions: {
    getInfo(valeur) {
      const id = localStorage.getItem("userChoice");
      axios
        .get("http://localhost:3000/" + id, {
          headers: {
            Authorization: "Bearer " + localStorage.getItem("userToken"),
          },
        })
        .then((response) => {
          console.log(response);
          valeur.commit("userInfo", [
            response.data[0].iduser,
            response.data[0].first_name,
            response.data[0].name,
            response.data[0].job,
            response.data[0].email,
            response.data[0].password,
            response.data[0].admin,
          ]);
          console.log(valeur);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    /*commentOne: function(value){
      let commentId = localStorage.getItem("userChoice")
      axios
        .get('http://localhost:3000/api/comment/' + commentId, {
          headers: {
            'Authorization':"Bearer " + localStorage.getItem("userToken"),
          },
        })
        .then((response) => {
          for(let i = 0; i<response.data.length; i++){
          value.commit('commentInfo', [response.data[i].idcomment,response.data[i].idcom, response.data[i].title, response.data[i].content, response.data[i].image])
          console.log(response)
          }
          
        })
        .catch((error) => {
          console.log(error);
        });
      
    },
    /*getComment(value) {
      axios
        .get('http://localhost:3000/comments' , {
          headers: {
            Authorization: "Bearer" + localStorage.getItem("userToken"),
          },
        })
        .then((response) => {
          console.log(response.data);
          value.commit('commentInfo', response.data[0].idcom);
          console.log(value);
        })
        .catch((error) => {
          console.log(error);
        });
    }*/
  },
});
