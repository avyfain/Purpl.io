module SessionsHelper

  def log_in!(user)
    session[:student_id] = student.id
  end
  
  def logged_in?
    session[:student_id].present?
  end

  def authenticated!
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def current_student
    @current_student ||= Student.find_by(id: session[:student_id])
  end

  def current_student?(student)
    @current_student == student
  end

end