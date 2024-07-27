# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def on_sale
    @products = Product.where(on_sale_status: true).page(params[:page]).per(10)
    render :index
  end

  def new_arrivals
    @products = Product.where('created_at >= ?', 3.days.ago).where('updated_at < ?', 3.days.ago).page(params[:page]).per(10)
    render :index
  end

  def recently_updated
    @products = Product.where('updated_at >= ?', 3.days.ago).where('created_at < ?', 3.days.ago).page(params[:page]).per(10)
    render :index
  end
end
