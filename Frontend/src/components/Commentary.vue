<template>
  <div class="media">
    <h1>L'actualité du reséau!</h1>
    <div
      class="media-body"
      v-for="(comment, index) in comments.slice().reverse()"
      :key="index"
    >
      <h2 class="media-heading">{{ comment.title }}</h2>
      <p>{{ comment.content }}</p>
      <img v-if="comment.image !== null" :src="comment.image" />
      <img v-else src="../assets/image/icon.png" />

      <div>
        Publiée par <b>{{ comment.author }}</b>
      </div>
      <div class="container mt-5">
        <div class="optionButton">
        <button 
        class="btn btn-primary"
        v-on:click="showReact = !showReact" v-if="showReact">
          Réagir à ce post
        </button>
        <button
        class="btn btn-primary" 
        v-on:click="AffichReact = !AffichReact" v-if="AffichReact">
          voir les react
        </button>
         <button
            class="btn btn-danger"
            v-if="idcom == comment.idcom || user.admin == 1"
            @click="deleteCom(comment)"
          >
            Supprimer votre post
          </button>
        </div>
        <div class="reaction" v-if="!showReact">
          <div class="row d-flex justify-content-center">
            <div class="col-md-8">
              <div class="card p-3">
                <div class="d-flex justify-content-between align-items-center">
                  <div class="user d-flex flex-row align-items-center">
                    <img
                      src="../assets/image/icon.png"
                      width="30"
                      class="user-img rounded-circle mr-2"
                    />
                    <span
                      ><small class="font-weight-bold text-primary name">{{
                        user.first_name
                      }}</small>
                    </span>
                  </div>
                  <textarea
                    class="form-control"
                    id="reactionText"
                    placeholder="Your message"
                    rows="4"
                    v-model="postReact"
                    @keyup.enter="react"
                  >
                  </textarea>
                </div>
                <div
                  class="
                    action
                    d-flex
                    justify-content-between
                    mt-2
                    align-items-center
                  "
                >
                  <div class="reply px-4">
                    <button  class="btn btn-light btn-primary" @click.prevent="react(comment)" >
                      <small> Réagir </small>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div v-if="!AffichReact" class="row d-flex justify-content-center">
          <div class="col-md-8">
            <div class="card p-3">
              <div
                v-for="(react, id) in reacts.filter((react) => {
                  return react.idReactComment == comment.idcomment;
                })"
                :key="id"
                class="d-flex justify-content-between align-items-center"
              >
                <div class="user d-flex flex-row align-items-center">
                  <img
                    src="../assets/image/icon.png"
                    width="30"
                    class="user-img rounded-circle mr-2"
                  />
                  <span
                    ><small class="font-weight-bold text-primary">{{
                      react.userReact
                    }}</small>
                  </span>
                </div>
                <small>{{ react.postReact }} </small>
                <button
                   class="btn btn-danger"
                  v-if="iduserReact == react.iduserReact || user.admin == 1"
                  @click="deleteReact(react)"
                >
                  Supprimer
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
let iduser1 = localStorage.getItem("userChoice");
import { mapState } from "vuex";
export default {
  name: "comment",
  data() {
    return {
      title: "",
      name: "",
      image: "",
      idcom: iduser1,
      comments: [],
      mask: true,
      postReact: "",
      userReact: "",
      iduserReact: iduser1,
      showReact: true,
      AffichReact: true,
      reacts: [],
    };
  },
  computed: {
    ...mapState(["user"]),
  },
  mounted() {
    //partie comment
    this.comments = [];
    axios
      .get("http://localhost:3000/api/comments", {
        headers: {
          Authorization: "Bearer " + localStorage.getItem("userToken"),
        },
      })
      .then((response) => {
        (this.comments = response.data), console.log(this.comments);
        console.log(response);
      })
      .catch((error) => {
        console.log(error);
      }),
      //partie user
      this.$store.dispatch("getInfo"),
      // partie react
    this.reacts = [];
    axios
      .get("http://localhost:3000/api/reacts", {
        headers: {
          Authorization: "Bearer " + localStorage.getItem("userToken"),
        },
      })
      .then((response) => {
        (this.reacts = response.data), console.log(this.reacts);
        console.log(response);
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    //partie comment
    async deleteCom(comment) {
      const deleteComment = window.confirm("Etes vous sûr?");
      if (deleteComment == true) {
        console.log(comment.idcomment + "ceci");
        await axios
          .delete("http://localhost:3000/api/comment/" + comment.idcomment, {
            headers: {
              Authorization: "Bearer " + localStorage.getItem("userToken"),
            },
          })
          .then((response) => {
            console.log(response);
            console.log("supprimer fait");
            location.reload();
          })
          .catch((error) => console.log(error));
      }
    },
    //partie react
    react: function (comment) {
      if (this.postReact !== null) {
        console.log(comment.idcomment);
        axios
          .post(
            "http://localhost:3000/react/",
            {
              postReact: this.postReact,
              userReact: this.$store.state.user.first_name,
              iduserReact: this.iduserReact,
              idReactComment: comment.idcomment,
            },
            {
              headers: {
                Authorization: "Bearer " + localStorage.getItem("userToken"),
              },
            }
          )
          .then((response) => {
            console.log(response.data);
            console.log(response);
            console.log("react envoyé à bdd");
            location.reload();
          })
          .catch((error) => {
            this.err = error.response;
            console.log(error);
          });
      } else {
        console.log("error bdd");
      }
    },
    deleteReact: function (react) {
      const deleteReact = window.confirm("Etes vous sûr?");
      if (deleteReact == true) {
        const reactSupp = react.idreact
        axios
          .delete("http://localhost:3000/react/"+ reactSupp, {
            headers: {
              Authorization: "Bearer " + localStorage.getItem("userToken"),
            },
          })
          .then(() => {
            console.log();
            console.log("supprimer fait");
            location.reload()
          })
          .catch((error) => console.log(error));
      }
    },
  },
};
</script>
<style scoped>
.optionButton{
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
.name{
  margin-right: 10px
}
#cadre {
  border: 1px solid black;
}
.infoReact {
  border: 1px solid black;
  display: flex;
  justify-content: space-between;
  width: 80%;
}
img {
  width: 70%;
  height: 50%;
  margin-left: auto;
  margin-right: auto;
  border: 2px solid black;
  object-fit: cover;
  background-color: blanchedalmond;
}
h1 {
  margin-left: auto;
  margin-right: auto;
  padding-top: 20px;
  padding-bottom: 50px;
  width: 100%;
  border-top: 1px solid black;
}
.media {
  width: 100%;
  margin-right: auto;
  margin-left: auto;
  padding: 25px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding-bottom: 20px;
  background-image: url("../assets/image/wallpaper.webp");
  background-repeat: round;
}
.media-body {
  display: flex;
  flex-direction: column;
  text-align: center;
  margin-right: auto;
  margin-left: auto;
  width: 90%;
  padding: 25px;
  margin-top: 10px;
  margin-bottom: 15px;
  border: 5px solid black;
}
.content-item {
  padding: 30px 0;
  background-color: #ffffff;
}

.content-item.grey {
  background-color: #f0f0f0;
  padding: 50px 0;
  height: 100%;
}

.content-item h2 {
  font-weight: 700;
  font-size: 35px;
  line-height: 45px;
  text-transform: uppercase;
  margin: 20px 0;
}

.content-item h3 {
  font-weight: 400;
  font-size: 20px;
  color: #555555;
  margin: 10px 0 15px;
  padding: 0;
}

.content-headline {
  height: 1px;
  text-align: center;
  margin: 20px 0 70px;
}

.content-headline h2 {
  background-color: #ffffff;
  display: inline-block;
  margin: -20px auto 0;
  padding: 0 20px;
}

.grey .content-headline h2 {
  background-color: #f0f0f0;
}

.content-headline h3 {
  font-size: 14px;
  color: #aaaaaa;
  display: block;
}

#comments {
  box-shadow: 0 -1px 6px 1px rgba(0, 0, 0, 0.1);
  background-color: #ffffff;
}

#comments form {
  margin-bottom: 30px;
}

#comments .btn {
  margin-top: 7px;
}

#comments form fieldset {
  clear: both;
}

#comments form textarea {
  height: 100px;
}

#comments .media {
  border-top: 1px dashed #dddddd;
  padding: 20px 0;
  margin: 0;
}

#comments .media > .pull-left {
  margin-right: 20px;
}

#comments .media img {
  max-width: 20px;
}

#comments .media h4 {
  margin: 0 0 10px;
}

#comments .media h4 span {
  font-size: 14px;
  float: right;
  color: #999999;
}

#comments .media p {
  margin-bottom: 15px;
  text-align: justify;
}

#comments .media-detail {
  margin: 0px;
}
.media-detail {
  margin: 12px;
}
#comments .media-detail li {
  color: #aaaaaa;
  font-size: 12px;
  padding-right: 10px;
  font-weight: 600;
}

#comments .media-detail a:hover {
  text-decoration: underline;
}

#comments .media-detail li:last-child {
  padding-right: 0;
}

#comments .media-detail li i {
  color: #666666;
  font-size: 15px;
  margin-right: 10px;
}
img.media-object {
  border: 1px solid black;
  width: 50px;
  height: 50px;
}
.card {
  border: none;
  box-shadow: 5px 6px 6px 2px #e9ecef;
  border-radius: 4px;
  margin-bottom: 20px;
}

.dots {
  height: 4px;
  width: 4px;
  margin-bottom: 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
}

.badge {
  padding: 7px;
  padding-right: 9px;
  padding-left: 16px;
  box-shadow: 5px 6px 6px 2px #e9ecef;
}

.user-img {
  margin: 4px;
  height: 50px;
  width: 50px;
}

.check-icon {
  font-size: 17px;
  color: #c3bfbf;
  top: 1px;
  position: relative;
  margin-left: 3px;
}

.form-check-input {
  margin-top: 6px;
  margin-left: -24px !important;
  cursor: pointer;
}

.form-check-input:focus {
  box-shadow: none;
}
</style>
