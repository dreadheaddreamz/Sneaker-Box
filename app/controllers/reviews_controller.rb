class ReviewsController < ApplicationController
    def new
    if
        @shoe = Shoe.find_by_id(params[:shoe_id])
        @review = @shoe.reviews.build
    else
        @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
          redirect_to review_path(@review)
        else
          render :new
        end
      end

    def index
        if @shoe = Shoe.find_by_id(params[:shoe_id]) #nested and shoe id
            @reviews = @shoe.reviews
        else
            #not nested
            @reviews = Review.all #not nested
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private
    def review_params
        params.require(:review).permit(:shoe_id, :content, :heat, :title)
    end
end