class StudentsController < ApplicationController

	def show
		@student = Student.find(params[:id])
		@course1 = @student.courses[0]
		@course2 = @student.courses[1]
		@course3 = @student.courses[2]
		@course4 = @student.courses[3]
    # @questions = Question.where(course_id: @course.id)
	end

	def edit
		@student = Student.find(params[:id])
	end

	def index
		@students = Student.all
	end

	def update
		@student = Student.find(params[:id])

	    respond_to do |format|
	      if @student.update(student_params)
	        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @student.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def create
		@student = Student.new(student_params)

		respond_to do |format|
			if @student.save
				format.html { redirect_to @student, notice: 'Student was successfully created.' }
				format.json { render action: 'show', status: :created, location: @student }
			else
				format.html { render action: 'new' }
				format.json { render json: @student.errors, status: :unprocessable_entity }
			end
		end
	end

	def new
		@student = Student.new
	end

	def schedule
		#this is the view

		@courses = Course.all.sort_by{|x| [x.subject, x.catalog_number]}

		@courses = @courses.map do |c|
			["#{c.subject} #{c.catalog_number}: #{c.title}", c.id]
		end

		#["EECS 311: Macrocomputation", 5]
	end

	def add_courses
		#this is the postx

		@student = Student.find(params[:id])
		@student.courses = []
		@student.courses.push(Course.find(params["course1"]), Course.find(params["course2"]), Course.find(params["course3"]), Course.find(params["course4"]))

		respond_to do |format|
	      if @student.save
	        format.html { redirect_to @student, notice: 'Courses were successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @student.errors, status: :unprocessable_entity }
	      end
	    end

		# params[:courses].each { c = C.find_by(id), current_student.courses << c }
	end

	   # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:id, :email, :password, :password_confirmation, :year, :major, :created_at, :updated_at)
    end

end