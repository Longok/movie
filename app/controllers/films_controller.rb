class FilmsController < ApplicationController

    def index
        @films = Film.all
    end

    def new
        @film = Film.new
    end

    def create
        @film = Film.new film_params
        if @film.save
            flash[:info] = "Create film successfully"
            redirect_to @film
        else
            render :new
        end
    end

    def show
        @film = Film.find params[:id]
    end

    def edit
        @film = Film.find params[:id]
    end

    def update
        @film = Film.find params[:id]
        if @film.update film_params
            flash[:info] = "Update film successfully"
            redirect_to @film
        else
            render :edit
        end
    end

    def destroy
        @film = Film.find params[:id]
        @film.destroy
        flash[:info] = "Delete movie successfully"
        redirect_to @film
    end

    private
    def film_params
        params.require(:film).permit :name, :year, :time, :image
    end
end
