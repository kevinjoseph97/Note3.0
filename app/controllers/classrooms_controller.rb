class ClassroomsController < ApplicationController

    def index 
        @classrooms = Classroom.all
        # binding.pry
    end

   
    def show 
        @classroom = Classroom.find_by(id: params[:id])
    end



    # private 

    # def classroom_params
    
    # end


    
end
