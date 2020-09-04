class RunsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_run, only: [:show, :edit, :update, :destroy]
    
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
        @run = Run.new(run_params)
        if @run.save 
            redirect_to run_path(@run)
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
        params.require(:run).permit(:run_race_name, :terrain, :location_city, :location_state, :month)
    end 

    def set_run
        @run = Run.find_by_id(params[:id])
    end 
end
