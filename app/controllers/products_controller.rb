# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('title LIKE ?', "%#{params[:search_term]}%").order(:title)
  end
end
