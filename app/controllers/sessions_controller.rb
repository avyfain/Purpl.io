class SessionsController < ApplicationController

  def new
  end

  def create
    student = Student.find_by(email: params[:email])

    if student && student.authenticate(params[:password])
      log_in!(student)

      if student.courses.empty?
        redirect_to schedule_student_path(student.id)
      else
        redirect_to student_path(student)
      end
    elsif prof = Professor.find_by(email: params[:email])
      log_in!(prof)

      redirect_to professor_path(prof)
    else
      @message = "Sorry, either the email address or password you entered was incorrect. Try again:"
      render :new
    end
  end

  def destroy
    session[:student_id] = nil
    redirect_to root_path
  end
end