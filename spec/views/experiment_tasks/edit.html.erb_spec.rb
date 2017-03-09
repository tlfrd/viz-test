require 'rails_helper'

RSpec.describe "experiment_tasks/edit", type: :view do
  before(:each) do
    @visualisation = assign(:visualisation, Visualisation.create!(
      :title => "Test",
      :html => "<b>woah</b>"
    ))
    @experiment = assign(:experiment, Experiment.create!(
      :name => nil
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
      :order => 1
    ))
  end

  it "renders the edit experiment_task form" do
    render

    assert_select "form[action=?][method=?]", experiment_task_path(@experiment_task), "post" do

      assert_select "select#experiment_task_experiment_id[name=?]", "experiment_task[experiment_id]"

      assert_select "select#experiment_task_task_id[name=?]", "experiment_task[task_id]"

      assert_select "input#experiment_task_order[name=?]", "experiment_task[order]"
    end
  end
end
