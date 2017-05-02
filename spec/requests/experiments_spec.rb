require 'rails_helper'

RSpec.describe "Experiments", type: :request do
  before(:each) do
    http_login
  end

  describe "GET /experiments" do
    it "works! (now write some real specs)" do
      get experiments_path, {}, @env
      expect(response).to have_http_status(200)
    end
  end
end
