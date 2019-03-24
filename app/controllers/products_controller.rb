class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.all.order(created_at: :ASC)
    @avg_rating = Review.where(product_id: @product.id).average(:rating)
  end

  
end
