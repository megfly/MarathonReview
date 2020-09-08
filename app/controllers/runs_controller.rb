class RunsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_run, only: [:show, :edit, :update, :destroy]
    
    def index 
        @runs = Run.all
    end 

    def show
        
    end 

    def new
        @run = Run.new 
    end 

    def create
        @run = current_user.runs.build(run_params)

        if @run.save 
            redirect_to run_path(@run)
        else 
            render :new 
        end 
    end 

    def edit 
        #how do make it so only the current user can edit and update
        #look at project(sinatra and lessons)
    end

    def update 
        @run.update(run_params)
        redirect_to run_path 
    end 

    def destroy
       #delete isnt working
    end

    private

    def run_params
        params.require(:run).permit(:run_race_name, :terrain, :location_city, :location_state, :month, :user_id)
    end 

    def set_run
        @run = Run.find_by_id(params[:id])
    end
end
