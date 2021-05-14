class ClassroomNotesController < ApplicationController
    #drop down for the classroom subject
    # ClassroomNote.first.classroom.student.username

    def index 
        @classroom_notes = ClassroomNote.all
    end

    def new 
        @classroom_note = ClassroomNote.new
        # binding.pry
       
    end

    def create


    end


    def edit
    end

    def update
    end

    private 

        def classnote_params 
            params.require(:classroom_note).permit(:note_id, :classroom_id, :sharable)
        end
    

end
