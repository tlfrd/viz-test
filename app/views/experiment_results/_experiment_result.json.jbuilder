json.extract! experiment_result, :id, :uuid, :experiment_id, :created_at, :updated_at
json.experiment_task_results experiment_result.experiment_task_results do |experiment_task_result|
  json.experiment_task_result_id experiment_task_result.id
  json.experiment_task_id experiment_task_result.experiment_task.id
  json.position experiment_task_result.experiment_task.order
  json.created_at experiment_task_result.created_at
  json.update_at experiment_task_result.updated_at
  json.results experiment_task_result.result do |result|
    if experiment_task_result.experiment_task.task.task_type == "Click"
      json.click_no result[0].to_i
      json.time result[1]["time"]
      json.coordinates result[1]["coordinates"]
    else
      json.answer result[0]["answer"]
    end
  end
end
json.completed experiment_result.completed
json.url experiment_url(experiment_result, format: :json)
