class RunsController < ApplicationController

    def index 
    end 

    def show
    end 

    def new
    end 

    def create
    end 

    def edit 
    end

    def update 
    end 

    def destroy
    end

    private

    def run_params
        params.require(:run).permit(:terrain, :location_city, :location_state, :month)
    end 
end
