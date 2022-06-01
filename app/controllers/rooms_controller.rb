class RoomsController < ApplicationController
    before_action :logged_in_admin, only: [:new, :create]

    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
    end

    def show
        @room = Room.find_by id: params[:id]
    end

    def create
        @room = Room.new rooms_params
        if @room.save
            flash[:info] = "Create room successfully"
            redirect_to @room
        else
            render :new
        end
    end

  

    private
    def rooms_params
        params.require(:room).permit :name
    end
end
