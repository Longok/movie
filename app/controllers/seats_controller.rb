class SeatsController < ApplicationController

    def new
        room = Room.find(params[:room_id])
        @seat = room.seats.build
    end

    def create
        room = Room.find(params[:room_id])
        @seat = room.seats.create seats_params
        if @seat.save
            flash[:info] = "Create seat successfully"
            redirect_to [@seat.room]
        else
            render :new
        end

    end

    def show
        @room = Room.find_by id: params[:id]
        @seat = @room.seats.order("id DESC")
    end


    private
    def seats_params
        params.require(:seat).permit :name, :room_id
    end

end
