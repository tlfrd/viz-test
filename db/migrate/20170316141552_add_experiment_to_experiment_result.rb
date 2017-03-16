class AddExperimentToExperimentResult < ActiveRecord::Migration[5.0]
  def change
    add_reference :experiment_results, :experiment, foreign_key: true
  end
end
