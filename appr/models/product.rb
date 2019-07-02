class Product < ApplicationRecord
    validates :title, :price, presence: true
    has_many :product_categories
    has_many :categories, through: :product_categories
end
