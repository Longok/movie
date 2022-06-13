class BookingsController < ApplicationController

    def index
        seat = Seat.find params[:seat_id]
        @bookings = seat.bookings
    end

    def new
        seat = Seat.find(params[:seat_id])
        showtime = Showtime.find_by id: params[:showtime_id]
        @booking = seat.bookings.build
    end


    def create
        seat = Seat.find(params[:seat_id])
        showtime = Showtime.find_by id: (params[:showtime_id])
        @booking = seat.bookings.create booking_params
        if seat && showtime
            flash[:danger] = "Ghế ngồi đã tồn tại"
            render :new

        else    
            if  @booking.save
                flash[:info] = "Đặt chổ ngồi thành công"
                redirect_to @booking.seat                
            else
                flash[:danger] = "Đặt chổ ngồi thất bại"
                render :new
            end
        end
    end

    def show
        @booking = Booking.find params[:id]
    end

    private
    def booking_params
        params.require(:booking).permit :seat_id, :showtime_id
    end
end
