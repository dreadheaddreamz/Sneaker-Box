class BrandsController < ApplicationController
    before_action :redirect_if_not_logged_in


    def index
      @brand = Brand.all
    end
  
end
