require 'pry'
class Api::V1::SneakersController < ApplicationController

    def index
      sneakers = Sneaker.all
        
      render json: SneakerSerializer.new(sneakers)
    end
    
    def create
      sneaker = Sneaker.new(sneaker_params)

      if sneaker.save
        # binding.pry
        render json: SneakerSerializer.new(sneaker), status: :created
      else
        # binding.pry
        render json: {errors: sneaker.errors.full_messages}
      end
    end

    def show
      sneaker = Sneaker.new(sneaker_params)

      if sneaker
        render json: SneakerSerializer.new(sneaker)
      else
        render json: {errors: sneaker.errors.full_messages}, status: :unprocessible_entity
      end
    end

    def update
      sneaker = Sneaker.find(params[:id])
      # binding.pry
      if sneaker.update(sneaker_params)
        # binding.pry
        render json: SneakerSerializer.new(sneaker), status: :accepted
      else
        render json: {errors: sneaker.errors.full_messages}
      end
    end

    def destroy
      sneaker = Sneaker.find(params[:id])
      sneaker.delete
      render json: SneakerSerializer.new(sneaker), status: :ok
    end
    
    private
    
    def sneaker_params
      params.require(:sneaker).permit(:name, :description, :image_url, :quantity, :shoe_size, :category_id)
    end

end
