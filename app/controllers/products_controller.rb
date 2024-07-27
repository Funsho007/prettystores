# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(10)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def on_sale
    @q = Product.ransack(params[:q])
    @products = Product.where(on_sale_status: true).page(params[:page]).per(10)
    @categories = Category.all
    render :index
  end

  def new_arrivals
    @q = Product.ransack(params[:q])
    @products = Product.where('created_at >= ?', 3.days.ago).where('updated_at < ?', 3.days.ago).page(params[:page]).per(10)
    @categories = Category.all
    render :index
  end

  def recently_updated
    @q = Product.ransack(params[:q])
    @products = Product.where('updated_at >= ?', 3.days.ago).where('created_at < ?', 3.days.ago).page(params[:page]).per(10)
    @categories = Category.all
    render :index
  end

  def search
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(10)
    @categories = Category.all
    render :index
  end
end
