class VisualisationsController < ApplicationController
  before_action :set_visualisation, only: [:show, :edit, :update, :destroy]

  def index
    @visualisations = Visualisation.all
  end

  def show
  end

  # def recreate
  #   @visualisation = Visualisation.find(params[:visualisation_id])
  # end
  #
  # def submit_json
  #   @visualisation = Visualisation.find(params[:visualisation_id])
  #   @colours = params[:visualisation][:colour_values]
  # end

  # def tasks
  #   @visualisation = Visualisation.find(params[:visualisation_id])
  # end

  def new
    @visualisation = Visualisation.new
  end

  def edit
  end

  def create
    @visualisation = Visualisation.new(visualisation_params)

    @visualisation.save
    redirect_to @visualisation
  end

  def update
    @visualisation.update(visualisation_params)
  end

  def destroy
    @visualisation.destroy
  end

  private
    def set_visualisation
      @visualisation = Visualisation.find(params[:id])
    end

    def visualisation_params
      params.require(:visualisation).permit(:title, :html, :img_src)
    end
end
