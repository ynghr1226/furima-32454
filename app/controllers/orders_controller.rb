class OrdersController < ApplicationController
  before_action :set_action
  before_action :sold_out
  before_action :authenticate_user!

  def index
    @order_shipping_adress = OrderShippingAdress.new
    if @item.user_id == current_user.id
        redirect_to root_path
    end

  end

  def create
    binding.pry
    @order_shipping_adress = OrderShippingAdress.new(order_params)
    if @order_shipping_adress.valid?
      pay_item
      @order_shipping_adress.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_adress).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      item_id: params[:item_id], token: params[:token], user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'
    ) # 通貨の種類（日本円）
  end

  def set_action
    @item = Item.find(params[:item_id])
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end
end
