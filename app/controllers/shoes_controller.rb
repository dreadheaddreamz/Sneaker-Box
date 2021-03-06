class ShoesController < ApplicationController
    before_action :set_shoes, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in


    def new
        @shoe = Shoe.new
        @shoe.build_brand
    end

    def create
        @shoe = Shoe.new(shoe_params)#instance variables
        @shoe.user_id = session[:user_id]
        if @shoe.save
            redirect_to shoe_path(@shoe)
        else
          @shoe.build_brand
          render :new
        end
      end

      def index
       if params[:s]
          @shoes = Shoe.where('name LIKE ?', "%#{params[:s]}%")#searches and displays all shoe by name
        else
          @shoes = Shoe.all
      end
    end

      def search
        @shoe = Shoe.search(params[:brand_attributes])
      end

      def show
      end

      def jordan
        @shoes = Shoe.where('name LIKE ? ', "%jordan%")
      end

      def edit
      end

      def update
        if @shoe.update(shoe_params)
          redirect_to shoe_path(@shoe)
        else
          render :edit
      end
    end

    def latest_shoes
      @shoes = Shoe.latest_shoes
    end

    def username
    end

    private

    def shoe_params
        params.require(:shoe).permit(:name, :description, :image, :brand_id, brand_attributes: [:name])#schema
    end

    def set_shoes
        @shoe = Shoe.find_by(id: params[:id])
        redirect_to shoes_path if !@shoe
    end
end
