class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_param, only: [:index, :create]

  def index
    @order_shipping_info = OrderShippingInfo.new
      if current_user.id == @item.user_id or @item.order.presence
        redirect_to root_path
      end
    
  end

  def create
    @order_shipping_info = OrderShippingInfo.new(order_params)
    if @order_shipping_info.valid? 
      pay_item
      @order_shipping_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private

  def order_params
    params.require(:order_shipping_info).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_num).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_4123125d00265eba4cacd10e"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_param
    @item = Item.find(params[:item_id])
  end


end
