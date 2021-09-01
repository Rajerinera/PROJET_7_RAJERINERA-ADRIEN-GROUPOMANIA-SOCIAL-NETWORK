<template>
  <nav class="navbar fixed-top navbar-expand-md custom-navbar navbar-dark">
    <img
      class="navbar-brand"
      src="../assets/image/icon-left-font-monochrome-white.png"
      id="logo_custom"
      alt="logo"
    />
    <button
      class="navbar-toggler navbar-toggler-right custom-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#collapsibleNavbar"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="col-md-4 ml-auto" id="collapsibleNavbar">
      <ul class="navbar-nav ml-auto nav">
        <li class="nav-item">
          <router-link class="nav-link" to="/comment"
            ><b>Accueil</b></router-link
          >
        </li>
        <li class="nav-item">
          <router-link class="nav-link" to="/profile"
            ><b>Profile</b></router-link
          >
        </li>
        <li class="nav-item" v-if="user.admin == 1">
          <router-link class="nav-link" to="/contact"
            ><b>Membres</b></router-link
          >
        </li>
        <li class="nav-item">
          <router-link class="nav-link" to="/modifComment"
            ><b>Vos commentaires</b></router-link
          >
        </li>
        <li class="nav-item">
          <a class="nav-link deconnecté" @click="disconnected"
            ><b>Deconnexion</b></a
          >
        </li>
      </ul>
    </div>
  </nav>
</template>
<script>
import { mapState } from "vuex";
export default {
  data: function () {
    return {};
  },
  computed: {
    ...mapState(["user"]),
  },
  mounted() {
    this.$store.dispatch("getInfo");
  },

  methods: {
    disconnected() {
      window.alert("Vous êtes déconnecté");
      localStorage.removeItem("userChoice");
      localStorage.removeItem("userToken");
      localStorage.removeItem("userFirstname");
      this.$router.push("/register");
    },
  },
};
</script>
<style scoped>
.nav {
  display: flex;
  margin-right: 40px;
  width: 70%;
}
#logo_custom {
  width: 150px;
}
.deconnecté {
  cursor: pointer;
}
a.nav-link:hover {
  background-color: black;
}
.custom-navbar {
  background-color: #343a40;
}
.nav-link {
  color: whitesmoke;
}
@media only screen and (max-width: 760px) {
  #logo_custom {
    width: 40%;
  }
}
</style>
