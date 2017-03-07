json.extract! task, :id, :name, :visualisation_id, :type, :description, :created_at, :updated_at
json.url task_url(task, format: :json)