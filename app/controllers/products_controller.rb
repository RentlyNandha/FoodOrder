class ProductsController < ApplicationController
    def index
    @category=Category.find(params[:category_id])
    @products=@category.products.all.order(:title)
    end
end
