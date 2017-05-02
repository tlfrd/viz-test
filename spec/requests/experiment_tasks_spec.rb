require 'rails_helper'

RSpec.describe "ExperimentTasks", type: :request do
  before(:each) do
    http_login
  end

  describe "GET /experiment_tasks" do
    it "works! (now write some real specs)" do
      get experiment_tasks_path, {}, @env
      expect(response).to have_http_status(200)
    end
  end
end
