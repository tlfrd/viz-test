json.extract! experiment_result, :id, :uuid, :experiment_id, :created_at, :updated_at
json.experiment_task_results experiment_result.experiment_task_results do |experiment_task_result|
  json.experiment_task_result_id experiment_task_result.id
  json.created_at experiment_task_result.created_at
  json.update_at experiment_task_result.updated_at
  json.results experiment_task_result.result do |result|
    json.click_no result[0].to_i
    json.time result[1]["time"]
    json.coordinates result[1]["coordinates"]
  end
end
json.completed experiment_result.completed
json.url experiment_url(experiment_result, format: :json)
