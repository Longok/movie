class ShowtimesController < ApplicationController
    before_action :logged_in_admin, only: [:new, :create]

    def index
        @showtimes = Showtime.includes(:room).all
    end

    def new
        @showtime = Showtime.new
        
    end

    def create
        @showtime = Showtime.new showtime_params
        if @showtime.save
            flash[:info] = "Tạo xuất chiếu thành công"
            redirect_to @showtime

        else
            render :new
        end
    end

    def show
        @showtime = Showtime.find params[:id]
    end

    def edit 
        @showtime = Showtime.find params[:id]
    end

    def update
        @showtime = Showtime.find params[:id]
        if @showtime.update showtime_params
            flash[:info] = "Cập nhật xuất chiếu thành công"
            redirect_to @showtime
        else
            render :edit
        end
    end

    def destroy
        @showtime = Showtime.find params[:id]
        @showtime.destroy
        flash[:info] = "Xóa xuất chiếu thành công"
        redirect_to @showtime
    end

    private

    def showtime_params
        params.require(:showtime).permit :time, :room_id, :film_id
    end
end
