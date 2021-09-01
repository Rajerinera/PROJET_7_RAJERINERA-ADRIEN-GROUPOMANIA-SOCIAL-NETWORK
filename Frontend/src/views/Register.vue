<template>
  <div class="register">
    <Register />
  </div>
</template>

<script>
import Register from "../components/Register.vue";
export default {
  name: "register",
  components: { Register },
};
</script>

<style scoped>
.register {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 100%;
  font-size: 30px;
}
</style>
