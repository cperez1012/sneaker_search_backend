class Api::V1::SneakersController < ApplicationController

    def index
        sneakers = Sneaker.all
        render json: sneakers
      end
    
      def create
        sneaker = Sneaker.new(sneaker_params)
        if sneaker.save
          render json: sneaker, status: :accepted
        else
          render json: {errors: sneaker.errors.full_messages}, status: :unprocessible_entity
        end
      end
    
      private
    
      def sneaker_params
        params.require(:sneaker).permit(:name, :description, :image_url, :category_id)
      end

end
