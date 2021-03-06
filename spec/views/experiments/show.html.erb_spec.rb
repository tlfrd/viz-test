require 'rails_helper'

RSpec.describe "experiments/show", type: :view do
  before(:each) do
    @experiment = assign(:experiment, Experiment.create!(
      :name => "Name",
      :uuid => "bd9wf9sduuhfisdhfhsifshhfjjbsnb8ds9f8",
      :intro_html => "Hello"
    ))
    @experiment_results = assign(:experiment_results, [
      ExperimentResult.create!(
      :experiment => @experiment,
      :uuid => ExperimentResult.generate_uuid,
      :device_type => "Other",
      :input_type => "Other"
      )
    ])
    @visualisation = assign(:visualisation, Visualisation.create!(
      :title => "Test",
      :html => "<b>woah</b>"
    ))
    @task = Task.create!(
      :name => "Name",
      :visualisation => @visualisation,
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
