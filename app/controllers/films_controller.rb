class FilmsController < ApplicationController
    before_action :logged_in_admin, only: [:new, :create]

    def index
        @films = Film.with_attached_image.order("id DESC")
    end

    def new
        @film = Film.new
    end

    def create
        @film = Film.new film_params
        if @film.save
            flash[:info] = "Tạo phim thành công"
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
            flash[:info] = "Cập nhật phim thành công"
            redirect_to @film
        else
            render :edit
        end
    end

    def destroy
        @film = Film.find params[:id]
        @film.destroy
        flash[:info] = "Xóa phim thành công"
        redirect_to @film
    end

    def search
        @films = Film.where("name LIKE ?", "%" + params[:q] + "%")
    end

    private
    def film_params
        params.require(:film).permit :name, :year, :time, :image
    end
end
