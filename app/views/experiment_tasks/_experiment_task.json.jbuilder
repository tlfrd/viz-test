json.extract! experiment_task, :id, :experiment_id, :task_id, :order, :created_at, :updated_at
json.url experiment_task_url(experiment_task, format: :json)