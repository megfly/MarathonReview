class ReviewsController < ApplicationController
    before_action :set_run_id, only: [:show, :create, :edit]
    before_action :find_review, only: [:show, :create, :edit, :update, :destroy]

    def index 
    end 

    def show
    end 

    def new
        #nested new route has access to run_id
        @run = Run.find_by_id(params[:run_id])
        @review = @run.reviews.build
    end 

    def create
        @review = @run.reviews.build(review_params)
        if @review.save 
            redirect_to run_review_path(@review.run_id, @review)
        else 
            render :new
        end 
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

    def set_run_id 
        @run = Run.find_by_id(params[:run_id])
    end 

    def find_review 
        @review = Review.find_by_id(params[:id])
    end 
end
