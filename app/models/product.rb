# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :image
  has_many :order_products

  validates :title, :price, :quantity, :description, :image, presence: true
end
