class NotesController < ApplicationController


    # def index 
    #     #filter only student notes??
    #     binding.pry
    #     @notes = Note.all 
    
    # end


    def new
        @note = Note.new 
    end


    def create 
    
        @note = Note.new(notes_params)
        binding.pry
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
        @note = Note.find(params[:id])
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
        params.require(:note).permit(:title, :content)
    end

    def find_classroom
        @classroom = Classrooom.find_by_id[params[:classroom_id]]
    end

    def note_classroom_params
        params.require(:note).permit(:title, :content, :classroom_id )
    end

end

