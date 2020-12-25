class OrdersController < ApplicationController
      def index
        @order_shipping_adress = OrderShippingAdress.new
        @item = Item.find(params[:item_id])
      end

    
      def create
        @order_shipping_adress = OrderShippingAdress.new(order_params)
        if @order_shipping_adress.valid?
            @order_shipping_adress.save
           redirect_to root_path
        else
          render action: :index
        end
      end

    private
    def order_params
        params.require(:order_shipping_adress).permit(:postcode,:prefecture_id,:city,:block,:building,:phone_number).merge(item_id: params[:item_id],token: params[:token], user_id: current_user.id)
    end
end
