require 'rails_helper'

RSpec.describe "experiment_tasks/index", type: :view do
  before(:each) do
    @experiment = assign(:experiment, Experiment.create!(
      :name => "Experiment1"
    ))
    @visualisation = assign(:visualisation, Visualisation.create!(
      :title => "Test",
      :html => "<b>woah</b>"
    ))
    @task = assign(:task, Task.create!(
      :name => "Name",
      :visualisation => @visualisation,
      :task_type => "Type",
      :description => "Description"
    ))
    assign(:experiment_tasks, [
      ExperimentTask.create!(
        :experiment => @experiment,
        :task => @task,
        :order => 0
      ),
      ExperimentTask.create!(
        :experiment => @experiment,
        :task => @task,
        :order => 0
      )
    ])
  end

  it "renders a list of experiment_tasks" do
    render
    assert_select "tr>td", :text => @task.name.to_s, :count => 2
    assert_select "tr>td", :text => @experiment.name.to_s, :count => 2
    assert_select "tr>td", :text => 0.to_s, :count => 2
  end
end
