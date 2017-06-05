class VisualisationsController < ApplicationController
  before_action :set_visualisation, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV["APP_USER"], password: ENV["APP_SECRET"]

  def index
    @visualisations = Visualisation.all
  end

  def show
    @html_link = @visualisation.html
    if (@visualisation.html.start_with?('http'))
      @visualisation.html = open(@visualisation.html).read
    end
  end

  def new
    @visualisation = Visualisation.new
  end

  def edit
  end

  def create
    @visualisation = Visualisation.new(visualisation_params)

    if @visualisation.save
      redirect_to @visualisation, notice: 'Visualisation was successfully created.'
    else
      render :new
    end
  end

  def update
    if @visualisation.update(visualisation_params)
      redirect_to @visualisation, notice: 'Visualisation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @visualisation.destroy
    respond_to do |format|
      format.html { redirect_to visualisations_url, notice: 'Visualisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_visualisation
      @visualisation = Visualisation.find(params[:id])
    end

    def visualisation_params
      params.require(:visualisation).permit(:title, :html, :img_src, :colour_list, :type_list)
    end
end
