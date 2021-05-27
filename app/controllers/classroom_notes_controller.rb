class ClassroomNotesController < ApplicationController


   
    before_action :authorized?
    

    def new 
        @classroomnote = ClassroomNote.new
    end

     
    def create
        @classroomnote = ClassroomNote.new(classroomnote_params)
    
        if @classroomnote.save 
            binding.pry
            current_student.classrooms << @classroomnote.classroom
            redirect_to classroom_note_path(@classroomnote)
        else
            render :new
        end
    end

    def show 
        @classroomnote = ClassroomNote.find_by(id: params[:id])
    end


   

    private 

        def classroomnote_params 
            params.require(:classroom_note).permit(:note_id, :classroom_id, :sharable)
        end

      

end
