class NotesController < ApplicationController
    before_action :authorized?
   
    def index 
          if params[:classroom_id]
            @student = current_student
            @classroom = find_classroom
            @notes = @classroom.notes.ordered_by.shared
            # binding.pry
          else
            @notes = Note.all
            # binding.pry
          end
    end


    def new
        if  params[:student_id]
            @student = current_student
            @note = @student.notes.build
            # binding.pry
        else
            render :new
        end
    end


    def create 
        if  params[:student_id]
            @note = current_student.notes.build(student_notes_params)
                @note.save 
                redirect_to classrooms_path
        else
            render :new 
        end
    end


    def show 
        @note = Note.find_by(id: params[:id])
    end



    def edit 
        if params[:student_id]
            @student = current_student
            @note = Note.find_by(id: params[:id])
        else
            redirect_to student_path(current_student)
        end
    end

    def update 
        if params[:student_id]
            @student = current_student
            @note = Note.find_by(id: params[:id])
                if @note.update(student_notes_params)
                 redirect_to student_note_path(current_student, @note)
                end
        else
            render :edit
        end
    end

    def destroy 
        @note = Note.find_by(id: params[:id])
        @note.delete
        redirect_to student_path(current_student)
    end



    private 


    def notes_params 
        params.require(:note).permit(:title, :content)
    end

    def student_notes_params 
        params.require(:note).permit(:title, :content, :student_id)
    end

    def find_classroom
        @classroom = Classroom.find_by_id(params[:classroom_id])
    end
   

end

