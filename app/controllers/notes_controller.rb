class NotesController < ApplicationController

    def new
        binding.pry
    end


    def create 
    end

    private 


    def notes_params 
        params.require(:note).permit(:title, :content)
    end
end

#need to set up student id to note being vcreated 