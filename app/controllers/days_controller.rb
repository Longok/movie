class DaysController < ApplicationController

    def index
        @days = Day.all
    end

    def new
        @day = Day.new
    end

    def create
        @day = Day.new day_params
        if @day.save
            flash[:info] = "Craete day successfully"
            redirect_to @day
        else
            render :new
        end
    end

    def show
        @day = Day.find params[:id]
    end

    def edit
        @day = Day.find params[:id]

    end

    def update
        @day = Day.find params[:id]
        if @day.update day_params
            flash[:info] = "Update day successfully"
            redirect_to @day
        else
            render :edit, notice: "Update fail"
        end
    end

    def destroy
        @day = Day.find params[:id]
        @day.destroy
        flash[:info] = "Delete day successfully"
        redirect_to @day
    end

    private

    def day_params
        params.require(:day).permit :name, :room_id
    end
end
