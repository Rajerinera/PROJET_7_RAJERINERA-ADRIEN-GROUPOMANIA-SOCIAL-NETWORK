<template>
  <div class="wrapper bg-white mt-sm-5">
    <h4 class="pb-4 border-bottom">Modifier votre profil</h4>
    <div class="d-flex align-items-start py-3 border-bottom">
      <img src="../assets/image/icon.png" class="img" alt="" />
    </div>
    <div class="py-2">
      <div class="row py-2">
        <div class="col-md-6">
          <p>Votre Prénom : {{ user.first_name }}</p>
          <input
            type="text"
            class="bg-light form-control"
            placeholder="Steve"
            v-model="first_name"
          />
        </div>
      </div>
      <div class="row py-2">
        <div class="col-md-6">
          <p>Votre nom : {{ user.name }}</p>
          <input
            type="text"
            class="bg-light form-control"
            placeholder="Steve"
            v-model="name"
          />
        </div>
      </div>
      <div class="row py-2">
        <div class="col-md-6">
          <label>Metier : {{ user.job }}</label>
          <input
            type="text"
            class="bg-light form-control"
            placeholder="Agriculteur"
            v-model="job"
          />
        </div>
      </div>

      <div class="py-3 pb-4 border-bottom">
        <button class="btn btn-primary mr-3" type="submit" @click="updateUser">
          Confirmer
        </button>
        <router-link to="/comment"
          ><button class="btn border button">Annuler</button></router-link
        >
      </div>
      <div class="d-sm-flex align-items-center pt-3" id="deactivate">
        <div class="ml-auto">
          <button class="btn danger" @click="deleteAccount">
            Supprimer votre compte
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
import axios from "axios";
export default {
  name: "profiling",
  data() {
    return {
      first_name: "",
      name: "",
      job: "",
    };
  },
  computed: {
    ...mapState(["user"]),
  },
  mounted() {
    this.$store.dispatch("getInfo");
  },
  methods: {
    deleteAccount() {
      const deleteUser = window.confirm("Etes vous sûr?");
      if (deleteUser == true) {
        const id = localStorage.getItem("userChoice");
        axios
          .delete("http://localhost:3000/" + id, {
            headers: {
              Authorization: "Bearer " + localStorage.getItem("userToken"),
            },
          })
          .then(() => {
            console.log("Delete fait");
            localStorage.clear();
            location.replace(location.origin);
          })
          .catch((error) => console.log(error));
      } else {
        console.log("Erreur dans le delete");
      }
    },
    updateUser() {
      const id = localStorage.getItem("userChoice");
      axios
        .patch(
          "http://localhost:3000/" + id,
          {
            first_name: this.first_name,
            name: this.name,
            job: this.job,
            id: id,
          },
          {
            headers: {
              Authorization: "Bearer " + localStorage.getItem("userToken"),
            },
          }
        )
        .then((response) => console.log("success", response), location.reload())
        .catch((error) => console.log(error));
    },
  },
};
</script>
<style scoped>
body {
  font-family: "Poppins", sans-serif;
  background-color: aliceblue;
}

.wrapper {
  padding: 30px 50px;
  border: 1px solid #ddd;
  border-radius: 15px;
  margin: 10px auto;
  max-width: 600px;
}

h4 {
  letter-spacing: -1px;
  font-weight: 400;
}

.img {
  width: 70px;
  height: 70px;
  border-radius: 6px;
  object-fit: cover;
}

#img-section p,
#deactivate p {
  font-size: 12px;
  color: #777;
  margin-bottom: 10px;
  text-align: justify;
}

#img-section b,
#img-section button,
#deactivate b {
  font-size: 14px;
}

label {
  margin-bottom: 0;
  font-size: 14px;
  font-weight: 500;
  color: #777;
  padding-left: 3px;
}

.form-control {
  border-radius: 10px;
}

input[placeholder] {
  font-weight: 500;
}

.form-control:focus {
  box-shadow: none;
  border: 1.5px solid #0779e4;
}

select {
  display: block;
  width: 100%;
  border: 1px solid #ddd;
  border-radius: 10px;
  height: 40px;
  padding: 5px 10px;
}

select:focus {
  outline: none;
}

.button {
  background-color: #fff;
  color: #0779e4;
}

.button:hover {
  background-color: #0779e4;
  color: #fff;
}

.btn-primary {
  background-color: #0779e4;
}

.danger {
  background-color: #fff;
  color: #e20404;
  border: 1px solid #ddd;
}

.danger:hover {
  background-color: #e20404;
  color: #fff;
}

@media (max-width: 576px) {
  .wrapper {
    padding: 25px 20px;
  }

  #deactivate {
    line-height: 18px;
  }
}
</style>
