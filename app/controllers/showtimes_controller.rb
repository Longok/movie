class ShowtimesController < ApplicationController

    def index
        @showtimes = Showtime.all
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
    end

    private

    def showtime_params
        params.require(:showtime).permit :time, :day_id
    end
end
