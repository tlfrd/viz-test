require 'rails_helper'

RSpec.describe "experiments/index", type: :view do
  before(:each) do
    assign(:experiments, [
      Experiment.create!(
        :name => "Name"
      ),
      Experiment.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of experiments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
