class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by id: params[:id]
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new user_params
        if @user.save
            flash[:info] = "Crate account successfully"
            redirect_to root_path
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit :name, :email, :password, :password_confirmation
    end

    
end
