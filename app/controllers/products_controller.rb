# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(:title).page(params[:page]).per(12)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('title LIKE ? AND category_id LIKE ?', "%#{params[:search_term]}%", "%#{params[:categories]}%").order(:title).page(params[:page]).per(12)
  end

  def new_products
    @products = Product.where("created_at > date('now','-3 day')").order(:title).page(params[:page]).per(12)
  end

  def update_products
    @products = Product.where("updated_at > date('now','-3 day')").order(:title).page(params[:page]).per(12)
  end
end
