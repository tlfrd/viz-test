require 'rails_helper'

RSpec.describe "experiment_tasks/index", type: :view do
  before(:each) do
    assign(:experiment_tasks, [
      ExperimentTask.create!(
        :experiment => nil,
        :task => nil,
        :order => 2
      ),
      ExperimentTask.create!(
        :experiment => nil,
        :task => nil,
        :order => 2
      )
    ])
  end

  it "renders a list of experiment_tasks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
