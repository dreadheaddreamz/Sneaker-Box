class ReviewsController < ApplicationController
    def new
    if
        @shoe = Shoe.find_by_id(params[:shoe_id])
        @review = @shoe.reviews.build
    else
        @review = Review.new
        end
    end

    def index
    end



    private
    def set_shoe
    end

end
