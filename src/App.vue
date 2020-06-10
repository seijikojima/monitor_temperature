<template>
  <div id="app">
    <Timeplot/>
  </div>
</template>

<script>
import Timeplot from './components/Timeplot.vue'

export default {
  name: 'App',
  components: {
    Timeplot
  },
  method : {
    hoge : function(){
      console.log("hoge")
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
