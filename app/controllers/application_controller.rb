class ApplicationController < ActionController::Base
    include SessionsHelper

    def logged_in_admin
        user = User.first
        unless logged_in && user
            flash[:danger] = "Please log in with admin"
            redirect_to login_path 
        end
    end
end
