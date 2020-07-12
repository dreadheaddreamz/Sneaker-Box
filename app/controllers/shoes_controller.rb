class ShoesController < ApplicationController
    before_action :set_shoes, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in


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
          @shoe.build_brand
          render :new
        end
      end

      def index
        @shoes = Shoe.all
      end

      def show
      end

      def edit
        if @shoe.update(shoe_params)
          redirect_to shoe_path(@shoe)
        else
          render :edit
      end
    end



    private

    def shoe_params
        params.require(:shoe).permit(:name, :description, :brand_id, brand_attributes: [:name])
    end

    def set_shoes
        @shoe = Shoe.find_by(params[:id])
        redirect_to shoes_path if !@shoe
    end
end
