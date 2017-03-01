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

  var l = 1280,
      h = 640;

  console.log(l,h);

  var ratio = l / h;

  console.log(ratio);

  var body = d3.select("body").node().getBoundingClientRect();

  var width = body.width;
  var height = width / ratio;

  console.log(width,height);

  var svg = d3.select("#map").append("svg")
      .attr("width", width)
      .attr("height", height);

  var projection = d3.geoEquirectangular()
    .scale(height / Math.PI)
      .translate([width / 2,height / 2])

  var path = d3.geoPath()
      .projection(projection);

  function getCoordinates(){ $.getJSON("/api/v1/iss-position", function(data) {
    var x = data["iss_position"]["longitude"];
    var y = data["iss_position"]["latitude"];
    console.log(x,y);
    drawIss([x,y]);
    }).done(function() {
    }).fail(function() {
      console.log("error")
    }).always(function() {
      setTimeout(function() {
        svg.selectAll("circle").remove();
        getCoordinates()}, 2000);
    });
  };

  function drawIss(data){
    svg.selectAll("circle")
    	.data(data)
    	.enter()
    	.append("circle")
    	.attr("cx", function(d) {
    		return projection(data)[0];
    	})
    	.attr("cy", function(d) {
    		return projection(data)[1];
    	})
    	.attr("r", "8px")
      .transition()
      .duration(3000)
      .style("fill-opacity", 0)
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

  $('#zipcode-submit').click('submit', function(event) {
      event.preventDefault();

      var zipcode = $("input[name=fetch-passover]").val();

      console.log(zipcode);
      $.ajax({
        url: "/api/v1/pass-time",
        method: "GET",
        data: {'zipcode': zipcode },
        type: 'json',
        success: function(){
          console.log("this is the response:");
          $(".passover-date").empty().append("<p class='date'>" + response + "</p>")
        }
      }).done(function() {
        $(".passover-date").empty().append("<p class='date'>" + response + "</p>");
      }).fail(function(){
        $(".passover-date").empty().append("THAT DID NOT WORK");
      });
  });

  getCoordinates();

});
