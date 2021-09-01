<template>
  <div class="sidebar">
    <img
      class="title"
      src="../assets/image/icon-left-font-monochrome-white.png"
    />
    <div class="menu-items">
      <router-link to="/" active-class="active" tag="button" class="side-btn">
        <div class="link-container">Presentation</div>
      </router-link>
      <router-link
        to="/login"
        active-class="active"
        tag="button"
        class="side-btn"
      >
        <div class="link-container">S'inscrire</div>
      </router-link>
      <router-link
        to="/register"
        active-class="active"
        tag="button"
        class="side-btn"
      >
        <div class="link-container">Se connecter</div>
      </router-link>
      <router-link
        to="/about"
        active-class="active"
        tag="button"
        class="side-btn"
      >
        <div class="link-container">About us</div>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  setup() {},
};
</script>

<style scoped>
.sidebar {
  background-color: #343a40;
}
img {
  width: 80%;
}
.title {
  font-size: 30px;
  margin-top: 15px;
}
.menu-items {
  display: flex;
  flex-direction: column;
  margin-top: 40px;
}
.menu-items > * {
  margin-top: 60px;
}
.side-btn {
  border: none;
  text-decoration: none;
  cursor: pointer;
  color: black;
  font-size: 15px;
  color: white;
}
@media (max-width: 576px) {
  .sidebar {
    margin-bottom: 20px;
  }
  .title {
    height: 40%;
  }
}
</style>
