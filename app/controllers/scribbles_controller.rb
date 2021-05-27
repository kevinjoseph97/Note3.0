class ScribblesController < ApplicationController
    
    before_action :authorized?
    

    def new 
        @scribble = Scribble.new
    end

     
    def create
        @student = current_student
        @scribble = Scribble.new(scribble_params)
        if @scribble.save 
            current_student.classrooms << @scribble.classroom
            redirect_to scribble_path(@scribble)
        else
            render :new
        end
    end

    def show 
        @scribble = Scribble.find_by(id: params[:id])
        redirect_to student_path(current_student)
    end


   

    private 

        def scribble_params 
            params.require(:scribble).permit(:note_id, :classroom_id, :sharable)
        end

    

end

