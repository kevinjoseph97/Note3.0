class ClassroomsController < ApplicationController
   
   before_action :authorized?
  
    def new
        @classroom = Classroom.new
    end

    def create 
        binding
        @classroom = Classroom.new(classroom_params)
        binding.pry
        if @classroom.save
            binding.pry
            current_student.classrooms << @classroom
            redirect_to classrooms_path
        else
            binding.pry
            @classroom.errors.full_messages
            render :new
        end
    end




    def index 
        @classrooms = current_student.classrooms
        @allclassrooms = Classroom.all 
    end

    
    def show
        @classroom = Classroom.find_by(id: params[:id])
       
    end

   private 

   def classroom_params 
    params.require(:classroom).permit(:subject, :student_id)
   end
    
end
