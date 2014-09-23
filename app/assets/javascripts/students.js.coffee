# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require chartjs

$ ->
  data = [
      {
          value: 300,
          color:"#F7464A",
          highlight: "#FF5A5E",
          label: "Red"
      },
      {
          value: 50,
          color: "#46BFBD",
          highlight: "#5AD3D1",
          label: "Green"
      },
      {
          value: 100,
          color: "#FDB45C",
          highlight: "#FFC870",
          label: "Yellow"
      }
  ]
  options = {
    animationEasing: 'easeOutCubic'
    responsive: true
    showTooltips: true
  }
  $.getJSON "/students/stats.json", null, (data)->
    context = $("#students-chart").get(0).getContext("2d")
    chart = new Chart(context).Doughnut(data, options)
