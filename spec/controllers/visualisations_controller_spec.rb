require 'rails_helper'

RSpec.describe VisualisationsController, type: :controller do

  before(:each) do
    http_login
  end
  
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the visualisations into @visualisations" do
      vis1, vis2 = Visualisation.create!, Visualisation.create!
      get :index

      expect(assigns(:visualisations)).to match_array([vis1, vis2])
    end
  end

  describe '#create' do
    it "creates a successful visualisation" do
      @visualisation = Visualisation.create(title: "CoolMap")
      expect(@visualisation).to be_an_instance_of Visualisation
    end
  end
end
