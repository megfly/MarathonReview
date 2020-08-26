class ReviewsController < ApplicationController

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

    def review_params
        params.require(:review).permit(:run_id, :user_id, :title, :review_race_name, :description, :rating)
    end 
end
