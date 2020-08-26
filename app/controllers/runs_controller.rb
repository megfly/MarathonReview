class RunsController < ApplicationController

    def index 
        @runs = Run.all
    end 

    def show
        @run = Run.find(params[:id])
    end 

    def new
        @run = Run.new 
    end 

    def create
        @run = Run.build(run_params)
        if @run.save 
            redirect_to run_path 
        else 
            render :new 
        end 
    end 

    def edit 
        @run = Run.find(params[:id])
    end

    def update 
        @run = Run.find(params[:id])
        @run.update(run_params)
        redirect_to run_path 
    end 

    def destroy
        @run = Run.find(params[:id])
    end

    private

    def run_params
        params.require(:run).permit(:terrain, :location_city, :location_state, :month)
    end 
end
