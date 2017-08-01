require 'rails_helper'

RSpec.describe VisualisationsController, type: :controller do
  before(:each) do
    http_login
    Visualisation.create(title: "CoolMap1", html: "https://raw.githubusercontent.com/tlfrd/viz-collection/master/comics/index.html")
    Visualisation.create(title: "CoolMap2", html: "https://raw.githubusercontent.com/tlfrd/viz-collection/master/comics/index.html")
  end
  
  describe "GET #index" do
    it "loads all of the visualisations" do
      get :index
      visualisations = Visualisation.all
      expect(assigns(:visualisations)).to match_array(visualisations)
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, id: Visualisation.first.id
      expect(response).to render_template("show")
    end
  end
end
