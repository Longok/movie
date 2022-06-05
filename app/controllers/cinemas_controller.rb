class CinemasController < ApplicationController

    def index
        @cinemas = Cinema.all
    end

    def new
        @cinema = Cinema.new
    end

    def create
        @cinema = Cinema.new cinema_params
        if @cinema.save
            flash[:info] = "Create movie successfully"
            redirect_to @cinema
        else
            render :new
        end
    end

    def show
        @cinema = Cinema.find params[:id]
    end

    def edit
        @cinema = Cinema.find params[:id]
    end

    def update
        @cinema = Cinema.find params[:id]
        if @cinema.update cinema_params
            flash[:info] = "Update movie successfully"
            redirect_to @cinema
        else
            render :edit
        end
    end

    def destroy
        @cinema = Cinema.find params[:id]
        @cinema.destroy
        flash[:info] = "Delete movie successfully"
        redirect_to @cinema
    end

    private
    def cinema_params
        params.require(:cinema).permit :name, :year, :time, :image
    end
end
