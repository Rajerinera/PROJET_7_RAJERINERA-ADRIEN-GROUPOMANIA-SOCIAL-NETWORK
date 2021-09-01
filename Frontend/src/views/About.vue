<template>
  <div class="about">
    <h1>Création du site</h1>
    <p>
      Creation du backend et du frontend avec une base de donnée Mysql pour le
      projet 7 d'Openclassroom Groupomania. Ceci est le dernier projet de ma
      formation où j'ai développé entièrement l'application du Back au Front. Ce
      site à été réalisé en Node Js Express avec une Api rest et les règles de
      sécurité Owasp en Back-end. Pour ce qui du Front-end, j'ai utilisé
      boostrap HTML Css et le framework Vue.js. Le projet Groupomania est un
      réseau social d'entreprise qui permet de partager des commentaires et des
      images. Un admin peut également modérer le site et enfin l'utilisateur
      peut modifier ou supprimer son profil. Installation: Installer Node Js
      pour le Back et les dépendances npm nécessaires puis lancer la serveur
      nodemon server ou node server. En Front le projet est en Vue CLI installer
      Vue et ses dépendances puis lancer l'application. Vous devez au préalable
      avoir votre base de données préparée.
    </p>
    <p>
      Pour me contacter cliquer sur
      <a href="mailto: adrien.rajerinera@live.fr">
        adrien.rajerinera@live.fr
      </a>
    </p>

    <p>Site crée par "Adrien Rajerinera"</p>
    <p class="cordialement">Cordialement!</p>
  </div>
</template>

<script>
export default {
  setup() {},
};
</script>

<style scoped>
.about {
  font-size: 20px;
  font-weight: bold;
  margin-top: 80px;
}
p {
  text-align: justify;
  margin-left: auto;
  margin-right: auto;
  width: 80%;
}
.cordialement {
  text-align: center;
}
</style>
