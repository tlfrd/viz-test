require 'rails_helper'

RSpec.describe "experiments/show", type: :view do
  before(:each) do
    @experiment = assign(:experiment, Experiment.create!(
      :name => "Name"
    ))
    @task = Task.create!(
      :name => "Name",
      :visualisation => nil,
      :task_type => "Type",
      :description => "Description"
    )
    @experiment_tasks = assign(:experiment_tasks, [
      ExperimentTask.create(
        :experiment => @experiment,
        :task => @task,
        :order => 0
      )
    ])
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
