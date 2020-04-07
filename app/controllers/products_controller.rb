# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(:title).page(params[:page]).per(12)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('title LIKE ?', "%#{params[:search_term]}%").order(:title)
  end
end
