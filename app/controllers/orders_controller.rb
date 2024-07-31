class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
    @address = current_user.addresses.first || Address.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total_price = calculate_total_price(current_user.cart) # Implement this method as needed
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:address_id, :total_price, order_items_attributes: [:product_id, :quantity])
  end

  def calculate_total_price(cart)
    # Implement logic to calculate total price including taxes based on province
    # Example:
    # cart.items.sum { |item| item.product.price * item.quantity } + tax_amount
  end
end
