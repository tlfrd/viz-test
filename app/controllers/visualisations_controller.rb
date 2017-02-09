class VisualisationsController < ApplicationController
  def index
    @visualisations = Visualisation.all
  end

  def show
    @visualisation = Visualisation.find(params[:id])
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
      params.require(:visualisation).permit(:title)
    end
end
