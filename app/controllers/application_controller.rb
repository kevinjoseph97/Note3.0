class ApplicationController < ActionController::Base

    helper_method :authorized?, :current_student


    def home 
    end

    

    def authorized?
        redirect_to '/signin' unless @current_student
    end


    def current_student 
        @current_student ||= Student.find(session[:student_id]) if session[:student_id]
    end


end
