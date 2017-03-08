require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @visualisation = assign(:visualisation, Visualisation.create!(
      :title => "Test",
      :html => "<b>woah</b>"
    ))
    @task = assign(:task, Task.create!(
      :name => "Name",
      :visualisation_id => @visualisation,
      :task_type => "Type",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Description/)
  end
end
