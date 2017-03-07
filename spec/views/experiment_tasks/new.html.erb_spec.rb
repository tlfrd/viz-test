require 'rails_helper'

RSpec.describe "experiment_tasks/new", type: :view do
  before(:each) do
    assign(:experiment_task, ExperimentTask.new(
      :experiment => nil,
      :task => nil,
      :order => 1
    ))
  end

  it "renders new experiment_task form" do
    render

    assert_select "form[action=?][method=?]", experiment_tasks_path, "post" do

      assert_select "input#experiment_task_experiment_id[name=?]", "experiment_task[experiment_id]"

      assert_select "input#experiment_task_task_id[name=?]", "experiment_task[task_id]"

      assert_select "input#experiment_task_order[name=?]", "experiment_task[order]"
    end
  end
end
