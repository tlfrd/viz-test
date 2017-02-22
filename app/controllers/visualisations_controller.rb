class VisualisationsController < ApplicationController
  def index
    @visualisations = Visualisation.all
  end

  def show
    @visualisation = Visualisation.find(params[:id])
  end

  def recreate
    @visualisation = Visualisation.find(params[:visualisation_id])
  end

  def submit_json
    @visualisation = Visualisation.find(params[:visualisation_id])
    @colours = params[:visualisation][:colour_values]
  end

  def tasks
    @visualisation = Visualisation.find(params[:visualisation_id])
  end

  def new
  end

  def create
    @visualisation = Visualisation.new(visualisation_params)

    @visualisation.save
    redirect_to @visualisation
  end

  private
    def visualisation_params
      params.require(:visualisation).permit(:title, :json_urL, :csv_urL)
    end
end
