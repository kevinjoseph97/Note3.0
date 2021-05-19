class StudentsController < ApplicationController


    # def index 
    #     @students = Student.all
    # end

    def new 
        @student = Student.new 
    end


    def create 
        @student = Student.new(student_params)
        binding.pry
        if @student.save
            session[:student_id] = @student.id
            # binding.pry
            redirect_to student_path(@student)
        else

            render 'new'
        end

    end

    def show 
        find_student
        
    end

    private 

    def student_params
        params.require(:student).permit(:username, :password)
    end

    def find_student 
        @student = Student.find(params[:id])
    end



end
