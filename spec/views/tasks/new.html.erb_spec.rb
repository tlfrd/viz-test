require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :name => "MyString",
      :visualisation => nil,
      :task_type => "",
      :description => "MyString"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "select#task_visualisation_id[name=?]", "task[visualisation_id]"

      assert_select "select#task_task_type[name=?]", "task[task_type]"

      assert_select "input#task_description[name=?]", "task[description]"
    end
  end
end
