<template>
  <div class="container">
    <line-chart 
    :chart-data="this.datacollection" :options="this.options"></line-chart>   
  </div>
  
</template>

<script>
  import LineChart from '../LineChart.js'
//   import store from '../store.js'
  export default {
    name : "linechart",
    data() {
        return {
        datacollection : null,
        options : null,
        data : [],
        array_humidity : [],
        array_temperature : [],
        array_date : []
        }
    },
    mounted() {
        this.get_data()
        

    },
    methods : {

      get_data : function(){
        this.axios.get("http://seijikojima.com:7001" + '/data')
        
        .then(response => {
          this.data = response.data.slice(50,300)

          for(let i=0;i<this.data.length; i+=4){
            var response_item = this.data[i]
            this.array_humidity.push(response_item.humidity)
            this.array_temperature.push(response_item.temperature)
            this.array_date.push(response_item.time)
          }
        this.render_chart()
      })
      .catch(error => console.log(error))
    },
        render_chart : function ()  {
            this.datacollection = {
                labels: this.array_date,
                
                datasets: [
                  {
                    label: "humidity",
                    data : this.array_humidity,
                    backgroundColor: "transparent",
                    borderColor: "rgba(65, 105, 225)",
                    // pointBackgroundColor: "rgba(265, 105, 225)|",
                    lineTension : 0,
                  },
                  {
                    label: "temperature",
                    data : this.array_temperature,
                    backgroundColor: "transparent",
                    borderColor: "rgba(255, 69, 0)",
                    // pointBackgroundColor: "rgba(255, 69, 0)|",
                    lineTension : 0,
                  }
                ],
            },
            this.options = {
                scales: {
                    yAxes: [
                    {
                        ticks: {
                        beginAtZero: true,
                        min: 0,
                        max: 100
                        }
                    }
                    ],xAxes: [{
          ticks: {
            autoSkip: true,
            maxTicksLimit: 10 //値の最大表示数
          }
        }]
                },
                legend: {
                    display: true,
                }
            }
        }
    },
    components : {
      LineChart
    }
  }
</script>

<style>
.container {
  margin : 50px auto 0 auto;
  padding : 20px;
  width : 60%;
  border : solid 1px #aaa;
  text-align :center;
  /* box-shadow: 0 0 8px #333; */
  /* background-color : #f0f0f0; */
}

</style>