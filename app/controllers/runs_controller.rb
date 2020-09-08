class RunsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_run, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]
    
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
        
    end

    def update 
        @run.update(run_params)
        redirect_to run_path 
    end 

    def destroy
       
    end

    private

    def run_params
        params.require(:run).permit(:run_race_name, :terrain, :location_city, :location_state, :month)
    end 

    def set_run
        @run = Run.find_by_id(params[:id])
    end 

    def correct_user 
        @run = Run.find_by_id(params[:id])
        unless current_user?(@run.user) #unless is the opposite of if, if current user is not the user
            flash[:notice] = "This isn't your race to edit. Users can only edit their own races"
        end 
    end 

end
