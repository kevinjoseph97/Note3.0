class NotesController < ApplicationController

    def new
        @note = Note.new 
    end




    def create 
        
       
        @note = Note.new(notes_params)
        @note.student = current_student
        binding.pry
        if @note.save 
            binding.pry
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




    private 


    def notes_params 
        params.require(:note).permit(:title, :content)
    end
end

#need to set up student id to note being vcreated 