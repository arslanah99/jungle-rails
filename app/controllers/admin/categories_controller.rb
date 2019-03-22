class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: "k", password: "k", except: :index

    def index
      # byebug
      @categories = Category.order(id: :desc).all
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(product_params)
  
      if @category.save
        redirect_to [:admin, :products], notice: 'Category created!'
      else
        render :new
      end
    end
  
    def destroy
      @category = Category.find params[:id]
      @category.destroy
      redirect_to [:admin, :categories], notice: 'Category deleted!'
    end
  
    private
  
    def product_params
      params.require(:category).permit(
        :name
      )
    end
  
  end
  