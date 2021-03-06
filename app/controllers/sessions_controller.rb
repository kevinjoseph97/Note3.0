class SessionsController < ApplicationController 
    #this is to track whos logged in
    def new 
    end


    def omniauth
        @student = Student.find_or_create_by(username: auth["info"]["first_name"]) do |s| 
            s.username = auth["info"]["first_name"]
            s.password = SecureRandom.hex(7)
        end
        if @student.save 
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            redirect_to '/'
        end

    end

    
    def create 
        @student = Student.find_by(username: params[:username])
        if @student && @student.authenticate(params[:password])
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            flash[:message] = "Hold UP, Lets Try That Again "
            binding.pry
            redirect_to signin_path
           
        end 
    end


    
    def destroy 
        session.clear 
        redirect_to signin_path
    end

    private 

    def auth
        request.env['omniauth.auth']
    end


end


