class ReviewsController < ApplicationController
    def new
    if
        @set_shoe
        @review = @shoe.reviews.build
    else
        @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(require_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
    end

    def index
        if set_shoe #nested and shoe id
            @reviews = @shoe.reviiews
        else
            @reviews = Review.all #not nested
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private
    def set_shoe
        @shoe = Shoe.find_by_id(params[:shoe_id])
    end

    def require_params
        params.require(:review).permit(:shoe_id, :content, :heat, :title, )
    end
    end
end