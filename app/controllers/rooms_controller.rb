class RoomsController < ApplicationController
    before_action :logged_in_admin, only: [:new, :create]

    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
    end

    def show
        @room = Room.find(params[:id])
    end
    
    def create
        @room = Room.new room_params
        if @room.save
            flash[:info] = "Tạo phòng thành công"
            redirect_to @room
        else
            render :new
        end
    end

    def destroy
        @room = Room.find_by id: params[:id]
        @room.destroy 
        flash[:info] = "Xóa phòng thành công"
        redirect_to @room
    end


    private
    def room_params
        params.require(:room).permit :name
    end
end
