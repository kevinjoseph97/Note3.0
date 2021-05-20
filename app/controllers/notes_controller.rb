class NotesController < ApplicationController


    def index 
    #   binding.pry
      if params[:classroom_id]
        @classroom = find_classroom
       
        @notes = @classroom.notes
        binding.pry
      else
        @notes = Note.all
        binding.pry
      end

    end


    def new
        if params[:classroom_id]
            @classroom = find_classroom
            @note = @classroom.notes.build
            binding.pry
        else
            @note = Note.new 
            binding.pry
        end
    end


    def create 
        @classroom = find_classroom
        if params[:classroom_id]
            binding.pry
            @note = @classroom.notes.build(notes_params)
            @note.student = current_student
        else
            # binding.pry
            @note = Note.new(notes_params)
            @note.student = current_student
            # binding.pry
        end




        if @note.save 
            # binding.pry
            redirect_to note_path(@note)
        else
            render :new
        end  
    end



    def show 
        @note = Note.find_by(id: params[:id])
    end



    def edit 
        @note = Note.find_by(id: params[:id])
    end

    def update 
        @note = Note.find_by(id: params[:id])
        if @note.update(notes_params)
            redirect_to note_path(@note)
        else
            render :edit
        end
    end

    def destroy 
        @note = Note.find_by(id: params[:id])
        @note.delete
        redirect_to root_path
    end




    private 


    def notes_params 
        params.require(:note).permit(:title, :content, :classroom_id)
    end

    def find_classroom
        @classroom = Classroom.find_by_id(params[:classroom_id])
    end

   

end

