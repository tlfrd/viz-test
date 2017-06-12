class ExperimentTaskResult < ApplicationRecord
  belongs_to :experiment_result
  belongs_to :experiment_task

  def self.get_average_time_all(experiment_tasks_results)
    total = 0
    count = 0
    experiment_tasks_results.each do |experiment_task_result|
      experiment_task_result.result.each do |json_result|
        total += json_result[1]["time"]
        count += 1
      end
    end
    return total/count
  end

  def self.get_average_time(experiment_tasks_results, click_pos)
    total = 0
    count = 0
    experiment_tasks_results.each do |experiment_task_result|
      experiment_task_result.result.each do |json_result|
        if json_result[0].to_i == click_pos.to_i
          total += json_result[1]["time"]
          count += 1
        end
      end
    end
    return total/count
  end

  def self.get_median_time(experiment_tasks_results, click_pos)
    array = []
    count = 0
    experiment_tasks_results.each do |experiment_task_result|
      experiment_task_result.result.each do |json_result|
        if json_result[0].to_i == click_pos.to_i
          array[count] = json_result[1]["time"]
          count += 1
        end
      end
    end
    sorted = array.sort
    median = (sorted[(count - 1) / 2] + sorted[count / 2]) / 2
    return median
  end

  def self.get_average_coordinates(experiment_task_results)
    total_x = 0
    total_y = 0
    count = 0
    experiment_task_results.each do |experiment_task_result|
      experiment_task_result.result.each do |json_result|
        total_x += json_result[1]["coordinates"][0]
        total_y += json_result[1]["coordinates"][1]
        count += 1
      end
    end
    return [total_x / count, total_y / count]
  end
end
