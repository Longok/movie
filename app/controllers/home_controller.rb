class HomeController < ApplicationController

    def index
        @films = Film.all.order("id DESC")

    end

    def show_titket

    end
end
