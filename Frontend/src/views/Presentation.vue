<template>
  <div class="presentation">
    <h1>Groupomania</h1>
    <p class="pres">
      Notre entreprise, spécialisée dans la grande distribution, est en pleine
      expansion. Nous avons actuellement plus de 600 collaborateurs et avons
      beaucoup recruté depuis quelques annnées. Nous étions uniquement 300 il y
      a 3 ans !
    </p>
  </div>
</template>

<script>
export default {
  setup() {},
};
</script>

<style scoped>
h1 {
  font-size: 60px;
  font-weight: bolder;
}
.presentation {
  position: absolute;
}

.pres {
  text-align: center;
  font-size: 25px;
  font-weight: bolder;
  width: 100%;
  position: relative;
  top: 30rem;
}
</style>
