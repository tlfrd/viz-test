function drawCircle(svg, x, y, size) {
  var circle = svg.append("circle")
      .attr('class', 'click-circle')
      .attr("cx", x)
      .attr("cy", y)
      .attr("r", size);
}

function drawCirclePro(svg, x, y, size, time, red, id) {
  var circle = svg.append("circle")
    .attr('class', function() {
      if (red) {
        return 'click-circle-red';
      } else {
        return 'click-circle';
      }
    })
    .attr("cx", x)
    .attr("cy", y)
    .attr("r", size)
    .attr("id", id)
    .append("title")
    .text(function(d) {
      return time + " ms";
    });
}

function appendRectangle(selected_svg) {
  var h = selected_svg.attr("height");
  var w = selected_svg.attr("width");

  selected_svg.append("rect")
          .attr("x", 0)
          .attr("y", 0)
          .attr("height", h)
          .attr("width", w)
          .style("stroke", "black")
          .style("fill", "none")
          .style("stroke-width", 1);
}

function highlightCircle(id) {
  $("#" + id)
    .attr("r", 7);
}

function deHighlightCircle(id) {
  $("#" + id)
    .attr("r", 5);
}

function drawRectangle(selected_svg, coordinates) {
  selected_svg
   .append("rect")
          .attr("x", coordinates[0][0])
          .attr("y", coordinates[0][1])
          .attr("height", coordinates[1][0] - coordinates[0][0])
          .attr("width", coordinates[1][1] - coordinates[0][1])
          .style("stroke", "black")
          .style("fill", "none")
          .style("stroke-width", 1);
}
