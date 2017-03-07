require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "MyString",
      :visualisation => nil,
      :type => "",
      :description => "MyString"
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_visualisation_id[name=?]", "task[visualisation_id]"

      assert_select "input#task_type[name=?]", "task[type]"

      assert_select "input#task_description[name=?]", "task[description]"
    end
  end
end
