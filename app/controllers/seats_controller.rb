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
            flash[:info] = "Tạo chổ ngồi thành công"
            redirect_to [@seat.room]
        else
            render :new
        end

    end

    def show
        @seat = Seat.find params[:id]
        @booking = @seat.bookings
    end

    def edit 
        room = Room.find(params[:room_id])
        @seat = room.seats.find(params[:id])
    end

    def update
        room = Room.find(params[:room_id])
        @seat = room.seats.find(params[:id])
        if @seat.update seat_params
            flash[:info] = "Cập nhật chổ ngồi thành công"
            redirect_to [@seat.room]
        else
            render :edit, notice: "Cập nhật chổ ngồi không thành công"
        end
    end


    def destroy
        room = Room.find(params[:room_id])
        @seat = room.seats.find(params[:id])
        @seat.destroy
        flash[:info] = "Xóa chổ ngồi thành công"
        redirect_to [@seat.room]
    end

    private
    def seat_params
        params.require(:seat).permit :name, :room_id
    end

end
