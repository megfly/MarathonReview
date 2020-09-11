class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_run_id, only: [:show, :create, :edit, :destroy]
    before_action :find_review, only: [:show, :create, :edit, :update, :destroy]

    def index 
        @reviews = Review.all
    end 

    def show
    end 

    def new
        #nested new route has access to run_id
        params[:run_id] && @run = Run.find_by_id(params[:run_id])
        @run = Run.find_by_id(params[:run_id])
        @review = @run.reviews.build
    end 

    def create
        @review = current_user.reviews.build(review_params)
        @review.user_id = current_user.id 
        @review.run_id = params[:run_id]
        if @review.save 
            flash[:success] = "Successfully created!"
            redirect_to run_review_path(@review.run_id, @review)
        else 
            render :new
        end 
    end 

    def edit 
    end

    def update 
        if @review.update(review_params)
            flash[:success] = "Successfully updated!"
            redirect_to run_review_path(@review.run_id, @review)
        else
            redirect_to '/'
        end
    end 

    def destroy
        @user = current_user
        @review.destroy
        redirect_to user_path(@user)
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
