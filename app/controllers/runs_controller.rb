class RunsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_run, only: [:show, :edit, :update, :destroy]
    
    def index 
        if params[:user_id]
            
            @runs = Run.where({ user_id: params[:user_id]})
        #if there is a user_id set the view to show all of that users runs 
        else 
        @runs = Run.all
        end 
    end 

    def show
    end 

    def new
        params[:user_id] && @user = User.find_by_id(params[:user_id])
        @run = Run.new
        #@run.reviews.build
    end 

    def create
        @run = current_user.runs.build(run_params)
        @run.user_id = current_user.id 

        if @run.save 
            flash[:success] = "Successfully created!"
            redirect_to run_path(@run)
        else 
            render :new 
        end 
    end 

    def edit 
    
    end

    def update 
        @user = User.find_by_id(params[:id])
       
        if @run.update(run_params)
            flash[:success] = "Successfully updated!"
            redirect_to run_path 
        else 
            render :edit 
        end 
    end 

    def destroy
        @user = current_user
        @run.destroy
        redirect_to user_path(@user)
    end

    private

    def run_params
        params.require(:run).permit(:run_race_name, :terrain, :location_city, :location_state, :month, :user_id)
        # reviews_attributes: [
        #     :title, 
        #     :review_race_name, 
        #     :description, 
        #     :rating,
        #     ]
        # )
    end 

    def set_run
        @run = Run.find_by_id(params[:id])
    end
end
