class StudentsController < ApplicationController

	def show
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
				format.html { redirect_to @student, notice: 'User was successfully created.' }
				format.json { render action: 'show', status: :created, location: @user }
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
	end

	def add_courses
	end

	   # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:id, :email, :password, :password_confirmation, :year, :major, :created_at, :updated_at)
    end

end