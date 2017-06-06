# require 'rails_helper'
#
# RSpec.describe "tasks/index", type: :view do
#   before(:each) do
#     @visualisation = assign(:visualisation, Visualisation.create!(
#       :title => "Test",
#       :html => "<b>woah</b>"
#     ))
#     assign(:tasks, [
#       Task.create!(
#         :name => "Name",
#         :visualisation => @visualisation,
#         :task_type => "Type",
#         :description => "Description"
#       ),
#       Task.create!(
#         :name => "Name",
#         :visualisation => @visualisation,
#         :task_type => "Type",
#         :description => "Description"
#       )
#     ])
#   end
#
#   it "renders a list of tasks" do
#     render
#     assert_select "tr>td", :text => "Name".to_s, :count => 2
#     assert_select "tr>td", :text => @visualisation.title.to_s, :count => 2
#     assert_select "tr>td", :text => "Type".to_s, :count => 2
#     assert_select "tr>td", :text => "Description".to_s, :count => 2
#   end
# end
