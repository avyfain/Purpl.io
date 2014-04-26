class ProfessorsController < ApplicationController

	def show
		@professor = Professor.find(params[:id])
		@course1 = @professor.courses[0]
		@course2 = @professor.courses[1]
		@course3 = @professor.courses[2]
		@course4 = @professor.courses[3]
    # @questions = Question.where(course_id: @course.id)
	end

	def edit
		@professor = Professor.find(params[:id])
	end

	def index
		@professors = Professor.all
	end

	def update
		@professor = Professor.find(params[:id])

	    respond_to do |format|
	      if @professor.update(professor_params)
	        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @professor.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def create
		@professor = Professor.new(professor_params)

		respond_to do |format|
			if @professor.save
				format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
				format.json { render action: 'show', status: :created, location: @professor }
			else
				format.html { render action: 'new' }
				format.json { render json: @professor.errors, status: :unprocessable_entity }
			end
		end
	end

	def new
		@professor = Professor.new
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

		@professor = Professor.find(params[:id])
		@professor.courses.push(Course.find(params["course1"]), Course.find(params["course2"]), Course.find(params["course3"]), Course.find(params["course4"]))

		respond_to do |format|
	      if @professor.save
	        format.html { redirect_to @professor, notice: 'Courses were successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @professor.errors, status: :unprocessable_entity }
	      end
	    end

		# params[:courses].each { c = C.find_by(id), current_professor.courses << c }
	end

	   # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:id, :email, :password, :password_confirmation, :year, :major, :created_at, :updated_at)
    end

end