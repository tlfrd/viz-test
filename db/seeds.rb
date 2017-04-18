Experiment.create!([
  {name: "Experiment1"}
])
ExperimentResult.create!([
  {experiment_task_result_id: nil, experiment_id: 1, uuid: "20fceb05-00d4-48dc-8e0c-299db0382551", completed: true},
  {experiment_task_result_id: nil, experiment_id: 1, uuid: "103314db-642e-482c-b078-285937a1a751", completed: true}
])
ExperimentTask.create!([
  {experiment_id: 1, task_id: 4, order: 1},
  {experiment_id: 1, task_id: 5, order: 2},
  {experiment_id: 1, task_id: 6, order: 3}
])
ExperimentTaskResult.create!([
  {result: {"0"=>{"time"=>1279, "coordinates"=>[141.40625, 222.375]}}, experiment_task_id: 2, experiment_result_id: 28},
  {result: {"0"=>{"time"=>594, "coordinates"=>[349.40625, 128.375]}, "1"=>{"time"=>1136, "coordinates"=>[201.40625, 194.375]}}, experiment_task_id: 3, experiment_result_id: 28},
  {result: {"0"=>{"time"=>710, "coordinates"=>[157.40625, 320.375]}, "1"=>{"time"=>1228, "coordinates"=>[515.40625, 338.375]}, "2"=>{"time"=>4891, "coordinates"=>[459.40625, 314.375]}}, experiment_task_id: 1, experiment_result_id: 28},
  {result: {"0"=>{"time"=>1544, "coordinates"=>[180.40625, 260.80206298828125]}}, experiment_task_id: 2, experiment_result_id: 29},
  {result: {"0"=>{"time"=>885, "coordinates"=>[334.40625, 170.80206298828125]}, "1"=>{"time"=>1544, "coordinates"=>[410.40625, 220.80206298828125]}, "2"=>{"time"=>3928, "coordinates"=>[340.40625, 418.80206298828125]}}, experiment_task_id: 3, experiment_result_id: 29},
  {result: {"0"=>{"time"=>1742, "coordinates"=>[246.40625, 194.80206298828125]}, "1"=>{"time"=>18461, "coordinates"=>[358.40625, 122.80206298828125]}}, experiment_task_id: 1, experiment_result_id: 29}
])
Task.create!([
  {name: "Bubble Map Three Clicks", visualisation_id: 11, task_type: "Click", description: "Click on two things", no_of_clicks: 3},
  {name: "Choropleth Single Click", visualisation_id: 6, task_type: "Click", description: "Click on a thing", no_of_clicks: 1},
  {name: "California Two Clicks", visualisation_id: 12, task_type: "Click", description: "Click on three things", no_of_clicks: 2}
])
Visualisation.create!([
  {title: "Bubble Map", json_url: nil, csv_url: nil, colour_values: nil, html: "https://gist.githubusercontent.com/tlfrd/18fcd399b66ed7077ed31d02896e3262/raw/d2fea540c79e673f1e6178a01d6a4cfbaf826b88/index.html", img_src: "https://gist.githubusercontent.com/tlfrd/18fcd399b66ed7077ed31d02896e3262/raw/ef7bfac797fcfa048ac5e6f82aa95ba01896dd76/thumbnail.png"},
  {title: "US Choropleth", json_url: "nil", csv_url: "nil", colour_values: nil, html: "https://gist.githubusercontent.com/tlfrd/6e598db83cab2c1163e03f4f35290ff5/raw/0eb4c26e1b6cc523c6ca9b3ea5700e639c853f25/index.html", img_src: "https://gist.githubusercontent.com/tlfrd/6e598db83cab2c1163e03f4f35290ff5/raw/0eb4c26e1b6cc523c6ca9b3ea5700e639c853f25/thumbnail.png"},
  {title: "California Choropleth", json_url: nil, csv_url: nil, colour_values: nil, html: "https://gist.githubusercontent.com/tlfrd/0c285dd6e010da64e794db4d5b566d5c/raw/4f9003246b727136cab4a5c46600b562ec82eac2/index.html", img_src: "https://gist.githubusercontent.com/tlfrd/0c285dd6e010da64e794db4d5b566d5c/raw/825c2889f93296bcb78e02a1f85a0981554c1ea7/thumbnail.png"},
  {title: "Kentucky Choropleth ", json_url: nil, csv_url: nil, colour_values: nil, html: "https://gist.githubusercontent.com/tlfrd/4300e28a662929aed8168398a1cba836/raw/f3ef8bc51662b9784ef00ac7f064fb274e68a2fa/index.html", img_src: "https://gist.githubusercontent.com/tlfrd/4300e28a662929aed8168398a1cba836/raw/f3ef8bc51662b9784ef00ac7f064fb274e68a2fa/thumbnail.png"}
])
