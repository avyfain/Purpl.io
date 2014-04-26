class SurveyResultsController < ApplicationController
  before_action :set_survey_result, only: [:show, :edit, :update, :destroy]

  # GET /survey_results
  # GET /survey_results.json
  def index
    @survey_results = SurveyResult.all
    @course = Course.find(params[:course_id])

    @questions = [
                  ["classtime","Class time is used productively."],
                  ["homework","Homework assignments are conducive to relevant learning."],
                  ["midterm","The midterm focused on relevant class material."],
                  ["workload","The weekly workload is acceptable"],
                  ["material","The class material (lectures, books, etc.) is useful and easily available."],
                  ["pace","The course pace is"],
                  ["passion","The instructor is passionate about teaching the course."]
                  ]
  end

  # GET /survey_results/1
  # GET /survey_results/1.json
  def show
  end

  # GET /survey_results/new
  def new
    @course = Course.find(params[:course_id])
    @survey_result = SurveyResult.new
  end

  # GET /survey_results/1/edit
  def edit
  end

  # POST /survey_results
  # POST /survey_results.json
  def create
    @survey_result = SurveyResult.new(survey_result_params)

    respond_to do |format|
      if @survey_result.save
        format.html { redirect_to @course, notice: 'Survey result was successfully created.' }
        format.json { render action: 'show', status: :created, location: @survey_result }
      else
        format.html { render action: 'new' }
        format.json { render json: @survey_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_results/1
  # PATCH/PUT /survey_results/1.json
  def update
    respond_to do |format|
      if @survey_result.update(survey_result_params)
        format.html { redirect_to @survey_result, notice: 'Survey result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_results/1
  # DELETE /survey_results/1.json
  def destroy
    @survey_result.destroy
    respond_to do |format|
      format.html { redirect_to survey_results_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_result
      @survey_result = SurveyResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_result_params
      params.require(:survey_result).permit(:classtime, :homework, :midterm, :workload, :material, :pace, :passion, :other, :user_id, :course_id)
    end
end
