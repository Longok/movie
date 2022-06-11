class BookingsController < ApplicationController

    def index
        @bookings = Booking.all.order('id DESC')
    end

    def new
        @booking = Booking.new
    end


    def create
        @booking = Booking.new booking_params
        if @booking.save
            flash[:info] = "Booking successfully"
            redirect_to @booking
        else
            render :new
        end
    end

    def show
        @booking = Booking.find params[:id]

    end

    private
    def booking_params
        params.require(:booking).permit :seat_id, :cinema_id, :showtime_id
    end
end
