function displayResults(results) {
    var results_html = "<table class='table'><tr>" +
    "<td><strong>No.</strong></td>" +
    "<td><strong>Coordinates (pixels)</strong></td>" +
    "<td><strong>Time (ms)</strong></td>" +
    "</tr>"
    for (var key in results) {
      var results_row = "<tr>" +
      "<td>" + key + "</td>" +
      "<td>(" + results[key].coordinates[0] + ", " + results[key].coordinates[1] + ")</td>" +
      "<td>" + results[key].time + "</td></tr>";
      results_html += results_row;
    }
    if (document.getElementById("results")) {
      document.getElementById("results").innerHTML = results_html + "</table>";
    }
    document.getElementById("request_result").value = JSON.stringify(results);
}
