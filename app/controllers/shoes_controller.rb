class ShoesController < ApplicationController
    def new
        @shoe = Shoe.new
        @shoe.build_brand
    end

    def create
        @shoe = Shoe.new(shoe_params)
        @shoe.user_id = session[:user_id]
        if @shoe.save
          redirect_to shoe_path(@shoe)
        else
          render :new
        end
      end

    private

    def shoe_params
        params.require(:shoe).permit(:name, :description, :shoe_id, brand_attributes: [:name])
    end
end
