require 'rails_helper'

RSpec.describe "experiments/show", type: :view do
  before(:each) do
    @experiment = assign(:experiment, Experiment.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
