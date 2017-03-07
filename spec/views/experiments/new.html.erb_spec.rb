require 'rails_helper'

RSpec.describe "experiments/new", type: :view do
  before(:each) do
    assign(:experiment, Experiment.new(
      :name => "MyString"
    ))
  end

  it "renders new experiment form" do
    render

    assert_select "form[action=?][method=?]", experiments_path, "post" do

      assert_select "input#experiment_name[name=?]", "experiment[name]"
    end
  end
end
