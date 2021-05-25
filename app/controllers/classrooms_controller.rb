class ClassroomsController < ApplicationController
   
   before_action :authorized?
  

    def index 
        @classrooms = current_student.classrooms
        @allclassrooms = Classroom.all 
        # binding.pry
    end

    
    def show
        @classroom = Classroom.find_by(id: params[:id])
       
    end

   
    
end
