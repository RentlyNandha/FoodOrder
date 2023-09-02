class Category < ApplicationRecord

  has_many :product_categories
  has_many :products, through: :product_categories

  def self.with_products
    joins(:products).select('categories.*, count(products.id) as products_count').group('categories.id').order(:title)
  end

  def self.with_products_count
    joins(:products).select('categories.*, count(products.id) as products_count').group('categories.id').order(:title)
  end

  def self.with_products_count_and_variants_count
    joins(:products).select('categories.*, count(products.id) as products_count, sum(products.variants_count) as variants_count').group('categories.id').order(:title)
  end

  def self.with_products_count_and_variants_count_and_min_price
    joins(:products).select('categories.*, count(products.id) as products_count, sum(products.variants_count) as variants_count, min(products.min_price) as min_price').group('categories.id').order(:title)
  end

  def self.with_products_count_and_variants_count_and_min_price_and_max_price
    joins(:products).select('categories.*, count(products.id) as products_count, sum(products.variants_count) as variants_count, min(products.min_price) as min_price, max(products.max_price) as max_price').group('categories.id').order(:title)
  end

  def self.with_products_count_and_variants_count_and_min_price_and_max_price_and_avg_price
    joins(:products).select('categories.*, count(products.id) as products_count, sum(products.variants_count) as variants_count, min(products.min_price) as min_price, max(products.max_price) as max_price, avg(products.avg_price) as avg_price').group('categories.id').order(:title)
  end

  def self.with_products_count_and_variants_count_and_min_price_and_max_price_and_avg_price_and_avg_weight
    joins(:products).select('categories.*, count(products.id) as products_count, sum(products.variants_count) as variants_count, min(products.min_price) as min_price, max(products.max_price) as max_price, avg(products.avg_price) as avg_price, avg(products.avg_weight) as avg_weight').group('categories.id').order(:title)
  end

  def remove_product(product_id)
    product = self.products.find(product_id)
    product.destroy
  end
end
