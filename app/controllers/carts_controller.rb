class CartsController < ApplicationController
  def show
    @cart = session[:cart] || {}
  end

  def add_item
    product_id = params[:product_id]
    session[:cart] ||= {}
    session[:cart][product_id] ||= 0
    session[:cart][product_id] += 1
    redirect_to cart_path, notice: 'Product added to cart.'
  end

  def remove_item
    product_id = params[:product_id].to_s
    session[:cart] ||= {}
    if session[:cart][product_id]
      session[:cart][product_id] -= 1
      session[:cart].delete(product_id) if session[:cart][product_id] <= 0
    end
    redirect_to cart_path, notice: 'Product removed from cart.'
  end
end
