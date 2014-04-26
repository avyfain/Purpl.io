module SessionsHelper


  def log_in!(user)
    if user.is_a? Student
      session[:student_id] = user.id
    else
      session[:professor_id] = user.id
    end
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

  def current_professor
    @current_professor ||= Professor.find_by(id: session[:professor_id])
  end

  def current_student?(student)
    @current_student == student
  end

end