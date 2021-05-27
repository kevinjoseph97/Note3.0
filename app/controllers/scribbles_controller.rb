class ScribblesController < ApplicationController
    
    before_action :authorized?
    

    def new 
        @scribble = Scribble.new
    end

     
    def create
        @student = current_student
        @scribble = Scribble.new(scribble_params)
        # binding.pry
        if @scribble.save 
            binding.pry
            current_student.classrooms << @scribble.classroom
            # binding.pry
            redirect_to scribble_path(@scribble)
        else
            # binding.pry
            render :new
        end
    end

    def show 
        @scribble = Scribble.find_by(id: params[:id])
        redirect_to student_path(current_student)
        #binding.pry
    end


   

    private 

        def scribble_params 
            params.require(:scribble).permit(:note_id, :classroom_id, :sharable)
        end

        # def scribble_note_params 
        #     params.require(:classroom_note).permit(:note_id, :classroom_id, :sharable, notes_attributes: [:title, :content])
        # end
    

end

