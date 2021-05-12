class SessionsController < ApplicationController 
    #this is to track whos logged in
    def new 

    end
    
    def create 
        @student = Student.find_by(username: params[:username])
        binding.pry
        if @student && @student.authenticate(params[:password])
            session[:student_id] = @student.id
            binding.pry
            redirect_to student_path(@student)
        else
            redirect_to signin_path
        end 
    end

    def destroy 
        session.clear 
        redirect_to signin_path
    end



end


