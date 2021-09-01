<template>
  <div>
    <Nav />
    <ProfilUser />
    <Footer />
  </div>
</template>

<script>
import Nav from "../components/Nav.vue";
import ProfilUser from "../components/ProfilUser.vue";
import Footer from "../components/Footer.vue";

export default {
  name: "contact",
  components: {
    Nav,
    ProfilUser,
    Footer,
  },
};
</script>

<style lang="scss"></style>
