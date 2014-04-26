class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @course = Course.find(params["course_id"])
  end

  def show
    @question = Question.find(params[:id])

    survey = SurveyResult.find_by(student_id: current_student.id, course_id: @question.course_id)


    puts "blah"*1000
    puts current_student.id
    puts survey.nil?


    if survey && (survey.created_at > @question.course.last_locked_on)
      
      @answers = Answer.where(question_id: @question.id).sort_by { |a| [ a.student_id ? 0 : 1, a.created_at] }.reverse
      @new_answer = Answer.new

      if not @question.read?(current_student ? current_student : current_professor)
        @question.readmap += (current_student ? current_student.id.to_s + "|" : current_professor.id.to_s + "|")
      end
      @question.save
      
    else
      flash[:warning] = "This course forum is currently locked. With your help, your course will improve and you will have access to the forum!"
      redirect_to new_course_survey_result_path(@question.course.id)
    end
  end

  def index
  end

  def create

    q = Question.new
    q.text = params["text"]

    session[:student_id] = 1
    q.student_id = current_student.id
    q.course_id = params["course_id"]
    q.readmap = ''
    q.save

    redirect_to course_path(params["course_id"])
  end

  def edit
  end

  def update
  end

  def destroy
  end


end