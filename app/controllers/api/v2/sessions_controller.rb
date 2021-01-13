# class SessionsController < ApplicationController
#     helper_method :logged_in?, :current_user

#     def new
#         if logged_in?
#             render json: @user
#         else
#             @user = User.new
#         end    
#     end

#     def create
#         @user = User.find_by(:email => params[:session][:email])

#         if @user && @user.authenticate
#     end
# end