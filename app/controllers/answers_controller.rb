class AnswersController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    answer = Answer.new
    if current_student
      answer.student_id = current_student.id
    else
      answer.professor_id = current_professor.id
    end

    answer.text = params["answer"]
    answer.question_id = question.id

    answer.save

    redirect_to course_question_path(question.course_id, question.id)
  end

end