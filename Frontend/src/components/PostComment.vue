<template>
  <div>
    <h1>Bienvenue sur notre réseau social Groupomania</h1>
    <div>
      <p class="bienvenue" v-if="user.admin == 0">
        Vous êtes connecté en tant que <b>{{ user.first_name }}</b>
      </p>
      <p class="bienvenue" v-else>
        Vous êtes connecté en tant qu'administrateur vous avez accès aux membres
      </p>
    </div>
    <button
      type="button"
      class="btn btn-primary publi"
      v-on:click="show = !show"
      v-if="show"
      v-bind:class="buttonPubli"
    >
      Publier un commentaire
    </button>
    <div class="col-sm-8" v-if="!show">
      <form>
        <fieldset>
          <div class="row">
            <div class="col-sm-3 col-lg-2 hidden-xs">
              <img
                class="img-responsive"
                src="../assets/image/icon.png"
                alt="logo"
              />
            </div>
            <div class="form-group col-xs-12 col-sm-9 col-lg-10 commentaire">
              <textarea
                class="form-control"
                id="title"
                placeholder="Your title"
                rows="3"
                v-model="title"
              >
              </textarea>
              <textarea
                class="form-control"
                id="message"
                placeholder="Your message"
                rows="4"
                v-model="content"
              >
              </textarea>

              <input
                type="file"
                ref="image"
                class="form-control"
                @change="upload"
              />
            </div>
          </div>
        </fieldset>
        <button
          type="submit"
          @click="commentUse"
          class="bg-light btn btn-outline-primary pull-right mb-4 btn-lg clic"
        >
          Publier !
        </button>
      </form>
    </div>
  </div>
</template>

<script>
let iduser1 = localStorage.getItem("userChoice");
import { mapState } from "vuex";
import axios from "axios";
export default {
  name: "postCom",
  data() {
    return {
      title: "",
      content: "",
      image: "",
      idcom: iduser1,
      selectedFileName: null,
      selectedFile: null,
      author: "",
      err: "",
      show: true,
      firstname: "",
      buttonPubli: true,
    };
  },
  computed: {
    ...mapState(["user"]),
  },
  methods: {
    upload: function () {
      this.image = this.$refs.image.files[0];
      console.log(this.image);
    },
    commentUse: function () {
      const fd = new FormData();
      if (this.selectedFileName != null && this.selectedFile != null) {
        fd.append("title", this.title);
        fd.append("content", this.content);
        fd.append("image", this.image, this.image.filename);
        fd.append("author", this.$store.state.user.first_name);
        fd.append("idcom", this.idcom);
      } else {
        fd.append("title", this.title);
        fd.append("content", this.content);
        fd.append("image", this.image, this.image.filename);
        fd.append("author", this.$store.state.user.first_name);
        fd.append("idcom", this.idcom);
      }
      console.log(fd);
      let test = "test";
      if (test) {
        axios
          .post("http://localhost:3000/comment/", fd, {
            headers: {
              Authorization: "Bearer " + localStorage.getItem("userToken"),
            },
          })
          .then((response) => {
            console.log(response.data);
            console.log(response);
            console.log("commentaire envoyé à bdd");
            location.reload();
          })
          .catch((error) => {
            this.err = error.response;
            console.log(error);
          });
      } else {
        console.log("error");
      }
    },
  },
};
</script>

<style scoped>
h1 {
  font-size: 30px;
}
.publi {
  margin-top: 20px;
}
.clic {
  border: 1px solid blue;
  color: blue;
}
.buttonPubli {
  display: none;
}
.bienvenue {
  width: 40%;
  color: whitesmoke;
  background-color: #343a40;
  font-size: 15px;
  padding: 5px;
  border: 1px solid white;
  text-align: center;
  margin-right: auto;
  margin-left: auto;
}
#form {
  width: 80%;
  display: flex;
  align-items: center;
  justify-content: space-evenly;
}
.form-group {
  display: flex;
  justify-content: space-between;
}
.description {
  margin-top: 13px;
  margin-right: 4px;
}
.commentaire {
  display: flex;
  flex-direction: column;
}
#title {
  width: 250px;
  height: 50px;
}
</style>
>
