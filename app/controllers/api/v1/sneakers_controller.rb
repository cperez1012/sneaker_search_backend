class Api::V1::SneakersController < ApplicationController

    def index
      sneakers = Sneaker.all
      # render json: sneakers
        
      render json: SneakerSerializer.new(sneakers)
    end
    
    def create
      sneaker = Sneaker.new(sneaker_params)

      if sneaker.save
        render json: SneakerSerializer.new(sneaker)
        # render json: sneaker, status: :accepted
      else
        render json: {errors: sneaker.errors.full_messages}, status: :unprocessible_entity
      end
    end

    # def show
    #   sneaker = Sneaker.new(sneaker_params)

    #   if sneaker
    #     render json: SneakerSerializer.new(sneaker)
    #   else
    #     render json: {errors: sneaker.errors.full_messages}, status: :unprocessible_entity
    #   end
    # end

    def update
      sneaker = Sneaker.find(params[:id])
      if sneaker.update(sneaker_params)
      # byebug
        render json: SneakerSerializer.new(sneaker)
      else
        render json: {errors: sneaker.errors.full_messages}, status: :unprocessible_entity
      end
      # Sneaker.all.push(sneaker)
      # render json: sneaker, status: accepted
    end

    def destroy
      sneaker = Sneaker.find(params[:id])
      sneaker.delete
      render json: SneakerSerializer.new(sneaker)
    end
    
    private
    
    def sneaker_params
      params.require(:sneaker).permit(:name, :description, :image_url, :category_id)
    end

end
