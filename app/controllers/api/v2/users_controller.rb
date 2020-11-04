class Api::V2::UsersController < ApplicationController

    #GET /users 
    def index
        @users = User.all

        render json: @users
    end

    #GET /users/id    
    def show

    end

    #POST /users
    def create
        # @user.User.new(user_paramas)

        # if @user.save
        #     render json: @user
        
        
    end
end 
