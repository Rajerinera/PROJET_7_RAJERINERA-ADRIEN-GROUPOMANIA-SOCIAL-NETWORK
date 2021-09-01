<template>
  <div class="login">
    <Log />
  </div>
</template>

<script>
import Log from "../components/Log.vue";
export default {
  name: "login",
  components: { Log },
};
</script>

<style scoped>
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 100%;
  font-size: 30px;
}
</style>
