class ProductsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.includes(:variants).order(:title)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to category_products_path(@product.category_id)
    else
      flash[:error] = "error occured"
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @variants = @product.variants
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to category_products_path(@product.category_id)
  end
  def add_new_category
    @product = Product.find(params[:id])
    @category = @product.create_category(category_params)

    if @category.present?
      redirect_to category_products_path(@category)
    else
      flash[:error] = "error occured"
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
