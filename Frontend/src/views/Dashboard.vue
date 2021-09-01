<template>
  <div class="dashboard">
    <Sidebar />
    <div class="content">
      <router-view />
    </div>
  </div>
</template>

<script>
import Sidebar from "../components/Sidebar.vue";
export default {
  components: { Sidebar },
  name: "Home",
};
</script>

<style scoped>
.dashboard {
  display: grid;
  grid-template-columns: 1fr 5fr;
  background-color: #343a40;
  height: 100vh;
  width: 100vw;
}

.content {
  background-image: url("../assets/image/background.webp");
  background-repeat: no-repeat;
  background-color: #f2f2f2;
  background-size: cover;
  background-position: center;
}

@media (max-width: 576px) {
  .dashboard {
    display: flex;
    flex-direction: column;
    background-color: #343a40;
    height: 100vh;
    width: 100vw;
  }
}
</style>
