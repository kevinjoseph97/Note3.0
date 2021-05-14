class ClassroomsController < ApplicationController
   
   
  

    def index 
        @classrooms = current_student.classrooms
        binding.pry
    end

    
    def show
        @classroom = Classroom.find_by(id: params[:id])
    end

   
    
end
