class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in #runs first before code

    
    def new
    if
        @shoe = Shoe.find_by_id(params[:shoe_id])
        @review = @shoe.reviews.build #allreviews
    else
        @review = Review.new #new
        end
    end

    def create
        @review = current_user.reviews.build(review_params) #new instance in memory
        if @review.save
          redirect_to review_path(@review) #all riviews
            
        elsif
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

    private #all private, can’t call private methods from outside the class that defines them.
    
    def review_params
        params.require(:review).permit(:shoe_id, :image, :content, :heat, :title)
    end
end