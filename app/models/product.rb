# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :image
  has_many :orders, through: :order_products
end
