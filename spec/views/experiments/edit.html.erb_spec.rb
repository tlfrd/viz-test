require 'rails_helper'

RSpec.describe "experiments/edit", type: :view do
  before(:each) do
    @experiment = assign(:experiment, Experiment.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit experiment form" do
    render

    assert_select "form[action=?][method=?]", experiment_path(@experiment), "post" do

      assert_select "input#experiment_name[name=?]", "experiment[name]"
    end
  end
end
