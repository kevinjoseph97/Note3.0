class ApplicationController < ActionController::Base

    helper_method  :current_student, :logged_in?


    def home 
    end

    

    def logged_in? 
        !!session[:student_id]
    end

    def current_student 
        @current_student ||= Student.find(session[:student_id]) if session[:student_id]
    end

    def authorized?
        redirect_to '/' if !logged_in?
    end



    def student_note
         current_student.id == @note.student_id 
    end

   
        



end
