# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  options = {
    animationEasing: 'easeOutCubic'
    responsive: true
    showTooltips: false
  }

  $(".assignment-chart").each ->
    elem = $(this)
    id = elem.data('id')
    url = "/assignments/"+id+"/graph_data.json"
    $.getJSON url, null, (data)->
      context = elem[0].getContext("2d")
      chart = new Chart(context).Doughnut(data, options)