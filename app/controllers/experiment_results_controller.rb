class ExperimentResultsController < ApplicationController
  before_action :set_experiment_result, only: [:destroy]

  # DELETE /experiment_results/1
  # DELETE /experiment_results/1.json
  def destroy
    @experiment_result.destroy
    respond_to do |format|
      format.html { redirect_to @experiment_result.experiment, notice: 'Experiment result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experiment_result
      @experiment_result = ExperimentResult.find(params[:id])
    end
end