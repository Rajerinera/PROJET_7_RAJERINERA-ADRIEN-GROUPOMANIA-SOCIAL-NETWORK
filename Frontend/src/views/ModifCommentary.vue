<template>
  <div>
    <Nav />
    <ModifComment />
    <Footer />
  </div>
</template>

<script>
import Nav from "../components/Nav.vue";
import ModifComment from "../components/ModifComment.vue";
import Footer from "../components/Footer.vue";
export default {
  name: "updateProfile",
  components: {
    Nav,
    ModifComment,
    Footer,
  },
};
</script>

<style></style>
