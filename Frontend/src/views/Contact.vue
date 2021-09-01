<template>
  <div>
    <Nav />
    <Contacts />
    <Footer />
  </div>
</template>

<script>
import Nav from "../components/Nav.vue";
import Contacts from "../components/Contacts.vue";
import Footer from "../components/Footer.vue";

export default {
  name: "contact",
  components: {
    Nav,
    Contacts,
    Footer,
  },
};
</script>

<style scoped></style>
