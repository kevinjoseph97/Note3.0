class NotesController < ApplicationController

    def index 
        @notes = Note.all
        #am i gonna nest this into user or classroom 
    end

    def new
        @note = Note.new 
    end

    def create
        @note = Note.new(notes_params)
        binding.pry
        if @note.save 
            redirect_to note_path(@note)
        else
            render 'new'
        end
    end

    def show 
        @note = Note.find_by(params[:id])
    end

    def edit 
        @note = Note.find_by(id: params[:id])
    end

    def update 
        @note = Note.find_by(id: params[:id])
        @note.update(notes_params)
        redirect_to note_path(@note)
    end


    def destroy 
        @note = Note.find_by(params[:id])
        @note.destroy
        redirect_to notes_path    
    end


    private 


    def notes_params 
        params.require(:note).permit(:title, :content)
    end
end
