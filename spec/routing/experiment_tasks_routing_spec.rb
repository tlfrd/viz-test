require "rails_helper"

RSpec.describe ExperimentTasksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/experiment_tasks").to route_to("experiment_tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/experiment_tasks/new").to route_to("experiment_tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/experiment_tasks/1").to route_to("experiment_tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/experiment_tasks/1/edit").to route_to("experiment_tasks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/experiment_tasks").to route_to("experiment_tasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/experiment_tasks/1").to route_to("experiment_tasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/experiment_tasks/1").to route_to("experiment_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/experiment_tasks/1").to route_to("experiment_tasks#destroy", :id => "1")
    end

  end
end
