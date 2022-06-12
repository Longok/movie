class ShowtimesController < ApplicationController

    def index
        @showtimes = Showtime.includes(:room).all
    end

    def new
        @showtime = Showtime.new
    end

    def create
        @showtime = Showtime.new showtime_params
        if @showtime.save
            flash[:info] = "Create times successfully"
            redirect_to @showtime

        else
            render :new
        end
    end

    def show
        @showtime = Showtime.find params[:id]
        @room = Room.find params[:id]
    end

    private

    def showtime_params
        params.require(:showtime).permit :time, :room_id, :film_id
    end
end
