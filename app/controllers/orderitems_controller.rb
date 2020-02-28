class OrderitemsController < ApplicationController
    before_action :authorized, only: [:create]

    def create
        # byebug
        @restitem_id = params[:restitem_id]
        @found_restitem = Restitem.find_by(id: @restitem_id)
        @found_restaurant_id = @found_restitem.restaurant_id

        if @user.cart.restaurant_id.nil?
            # byebug
            @user.cart.update(restaurant_id: @found_restaurant_id)
        end

        if @user.cart.restaurant_id === @found_restaurant_id
            @new_orderitem = Orderitem.create(orderitems_params)
        end

        render json: @user.cart
    end

    def delete
        
    end

    private

    def orderitems_params
        params.permit(:restitem_id, :order_id, :price)
    end

end
