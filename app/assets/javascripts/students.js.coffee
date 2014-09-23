# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require chartjs

$ ->

  options = {
    animationEasing: 'easeOutCubic'
    responsive: true
    showTooltips: true
  }
  if (elem = $("#students-chart").get(0))
    $.getJSON "/students/stats.json", null, (data)->
      context = elem.getContext("2d")
      chart = new Chart(context).Doughnut(data, options)
