function drawCircle(svg, x, y, size) {
  var circle = svg.append("circle")
      .attr('class', 'click-circle')
      .attr("cx", x)
      .attr("cy", y)
      .attr("r", size);
}
