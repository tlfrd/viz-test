require 'rails_helper'

RSpec.describe "experiment_tasks/show", type: :view do
  before(:each) do
    @experiment = assign(:experiment, Experiment.create!(
      :name => nil
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
    @experiment_task = assign(:experiment_task, ExperimentTask.create!(
      :experiment => @experiment,
      :task => @task,
      :order => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
