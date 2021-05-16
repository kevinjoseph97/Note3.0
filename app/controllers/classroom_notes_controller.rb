class ClassroomNotesController < ApplicationController
    #drop down for the classroom subject
    # ClassroomNote.first.classroom.student.username

    #don't need this... 
    # def index 
    #     @classroom_notes = ClassroomNote.all
    # end

    

    def new 
        
        @classroomnote = ClassroomNote.new
        # binding.pry
       

    end

    def create
        
        @classroomnote = ClassroomNote.new(classroomnote_params)
        binding.pry
        if @classroomnote.save 
            binding.pry
            current_student.classrooms << @classroomnote.classroom
            binding.pry
            redirect_to classroom_note_path(@classroomnote)
        else
            binding.pry
            render :new
        end
    end

    def show 
        @classroomnote = ClassroomNote.find_by(id: params[:id])
        binding.pry
    end


    #do I want to edit notes from here
    # def edit
    # end

    # def update
    # end

    private 

        def classroomnote_params 
            params.require(:classroom_note).permit(:note_id, :classroom_id, :sharable)
        end

        # def classroomnote_note_params 
        #     params.require(:classroom_note).permit(:note_id, :classroom_id, :sharable, notes_attributes: [:title, :content])
        # end
    

end
