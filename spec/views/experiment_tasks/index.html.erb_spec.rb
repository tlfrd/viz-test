require 'rails_helper'

RSpec.describe "experiment_tasks/index", type: :view do
  before(:each) do
    @experiment = assign(:experiment, Experiment.create!(
      :name => nil
    ))
    @task = assign(:task, Task.create!(
      :name => "Name",
      :visualisation => nil,
      :task_type => "Type",
      :description => "Description"
    ))
    assign(:experiment_tasks, [
      ExperimentTask.create!(
        :experiment => @experiment,
        :task => @task,
        :order => 2
      ),
      ExperimentTask.create!(
        :experiment => @experiment,
        :task => @task,
        :order => 2
      )
    ])
  end

  it "renders a list of experiment_tasks" do
    render
    assert_select "tr>td", :text => @task.name.to_s, :count => 2
    assert_select "tr>td", :text => @experiment.name.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
