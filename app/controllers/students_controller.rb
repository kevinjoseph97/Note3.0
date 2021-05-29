class StudentsController < ApplicationController


    def new 
        @student = Student.new 
    end


    def create 
        @student = Student.new(student_params)
        if @student.save
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            render 'new'
        end
    end

    def show 
        authorized?
        @student = Student.find_by_id(params[:id])
        redirect_to '/' if !@student
    end

    def search 
        # binding.pry 
        if params[:search].blank?
            redirect_to student_path(current_student)
        else
            @parameter = params[:search].downcase  
            @results = Note.all.where("lower(title) LIKE :search", search: @parameter)  
        end
    end


    private 

    def student_params
        params.require(:student).permit(:username, :password, :uid, :provider)
    end

   

end
