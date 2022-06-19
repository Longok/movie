class BookingsController < ApplicationController

    def index
        seat = Seat.find params[:seat_id]
        @bookings = seat.bookings
    end

    def new
        @showtime = Showtime.find params[:showtime_id]
        @booking = @showtime.bookings.build
        @seats = Seat.by_showtime(@showtime.id)
    end


    def create
        @showtime = Showtime.find params[:showtime_id]
        @booking = @showtime.bookings.new(booking_params)
        if  @booking.save
            flash[:info] = "Đặt chổ ngồi thành công"
            redirect_to showtime_booking_path(@booking, showtime_id: @showtime.id)
        else
            flash[:danger] = "Đặt chổ ngồi thất bại"
            @seats = Seat.by_showtime(@showtime.id)
            render :new
        end
    end

    def show
        @booking = Booking.find params[:id]
    end

    private

    def booking_params
        params.require(:booking).permit :seat_id
    end
end
