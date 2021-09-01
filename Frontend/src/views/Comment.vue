<template>
  <div>
    <Nav />
    <PostComment />
    <Commentary />
    <Footer />
  </div>
</template>

<script>
import Nav from "../components/Nav.vue";
import PostComment from "../components/PostComment.vue";
import Commentary from "../components/Commentary.vue";
import Footer from "../components/Footer.vue";
export default {
  name: "commentary",
  components: {
    Nav,
    PostComment,
    Commentary,
    Footer,
  },
};
</script>

<style></style>
