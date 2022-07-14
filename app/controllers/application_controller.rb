class ApplicationController < ActionController::Base
    include SessionsHelper
    include Pagy::Backend #scroll load page

    def logged_in_admin
        unless logged_in && current_user.admin?
            flash[:danger] = "Please log in with admin"
            redirect_to login_path
        end
    end

    
end
