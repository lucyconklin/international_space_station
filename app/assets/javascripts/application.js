// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require d3
//= require_tree .

$(document).ready(function(){
  var width = 1280,
      height = 640;

  var svg = d3.select("#map").append("svg")
      .attr("width", width)
      .attr("height", height);

  var projection = d3.geoEquirectangular()
    .scale(height / Math.PI)
      .translate([width / 2,height / 2])

  var path = d3.geoPath()
      .projection(projection);

  var draw_iss = function (x,y) {
    svg.selectAll("circle")
      .data([x,y]).enter()
      .append("circle")
      .attr("cx", function (d) { console.log(projection(d)); return projection(d)[0]; })
      .attr("cy", function (d) { console.log(projection(d)); return projection(d)[1]; })
      .attr("r", "8px")
      .attr("d", path);
  };

  d3.json("https://gist.githubusercontent.com/abenrob/787723ca91772591b47e/raw/8a7f176072d508218e120773943b595c998991be/world-50m.json", function(error, world) {
    svg.append("g")
      .attr("class", "land")
      .selectAll("path")
      .data([topojson.feature(world, world.objects.land)])
        .enter().append("path")
        .attr("d", path);
    svg.append("g")
        .attr("class", "boundary")
      .selectAll("boundary")
        .data([topojson.feature(world, world.objects.countries)])
        .enter().append("path")
        .attr("d", path);
  });

  $.getJSON("http://api.open-notify.org/iss-now.json", function(data) {
    var x = [data["iss_position"]["longitude"]];
    var y = [data["iss_position"]["latitude"]];
    console.log(x,y);
    draw_iss(x,y);
  });
});
