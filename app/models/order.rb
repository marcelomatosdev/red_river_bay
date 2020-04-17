# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products

  validates :status, :pst, :gst, :hst, :total, presence: true
end
