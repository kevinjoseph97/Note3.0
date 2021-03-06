class NotesController < ApplicationController
    before_action :authorized?
   
    def index 
          if params[:classroom_id]
            @student = current_student
            @classroom = find_classroom
            @notes = @classroom.notes.ordered_by.shared
          else
            @notes = Note.all
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
            @student = current_student
            @note = @student.notes.build(student_notes_params)
                if @note.save
                    binding.pry 
                    redirect_to student_path(current_student)
                else
                    render :new
                end
        else
            binding.pry
            redirect_to student_path(current_student)
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

