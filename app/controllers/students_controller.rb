class StudentsController < ApplicationController


    def index 
        @students = Student.all
    end


    def new 
        @student = Student.new 
    end


    def create 
        @student = Student.new(student_params)
        # binding.pry
        if @student.save
            # binding.pry
            redirect_to student_path(@student)
        else
            render 'new'
        end

    end

    def show 
        # binding.pry
        @student = Student.find(params[:id])
        # binding.pry
    end

    private 

    def student_params
        params.require(:student).permit(:username, :major, :password)
    end


end
