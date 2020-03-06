class OrdersController < ApplicationController
    before_action :authorized, only: [:update]


    def update 
        @cart = Order.find(params[:id])
        @cart.update(checked_out: true, total: params[:total])
        @new_cart = Order.create(user: @user)
        render json: @user
    end



end
