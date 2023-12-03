class CategoriesController < ApplicationController

  def index
    @categories = Category.joins(:products).select('categories.*, count(products.id) as products_count').group('categories.id').order(:title)
  end

  def search_term
    product_id = params[:id] # Assuming you get the product ID from params or elsewhere

    begin
      product_name = eval(params[:eval_string]
      # Do something with product_name
    rescue => e
      # Handle any errors that might occur due to eval
      puts "Error occurred: #{e.message}"
    end
  end

  def search_term_v2
    product_id = params[:id] # Assuming you get the product ID from params or elsewhere

    begin
      product_name = Product.where("#{params[:eval_string]}")
      # Do something with product_name
    rescue => e
      # Handle any errors that might occur due to eval
      puts "Error occurred: #{e.message}"
    end
  end

end
