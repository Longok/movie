class SeatsController < ApplicationController

    def index
        room = Room.find(params[:room_id])
        @seats = room.seats
    end

    def new
        room = Room.find(params[:room_id])
        @seat = room.seats.build
    end

    def create
        room = Room.find(params[:room_id])
        @seat = room.seats.create seat_params
        if @seat.save
            flash[:info] = "Create seat successfully"
            redirect_to [@seat.room]
        else
            render :new
        end

    end

    def edit 
        room = Room.find(params[:room_id])
        @seat = room.seats.find(params[:id])
    end

    def update
        room = Room.find(params[:room_id])
        @seat = room.seats.find(params[:id])
        if @seat.update seats_params
            flash[:info] = "Update seat successfully"
            redirect_to [@seat.room]
        else
            render :edit, notice: "Update fail"
        end
    end


    def destroy
        room = Room.find(params[:room_id])
        @seat = room.seats.find(params[:id])
        @seat.destroy
        flash[:info] = "Delete seat successfully"
        redirect_to [@seat.room]
    end

    private
    def seat_params
        params.require(:seat).permit :name, :room_id
    end

end
