# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def search_by_category
    @category = Category.find(params[:id])
    # @category = Category.where('id LIKE ?', "%#{params[:search_term]}%")
    # @productsbycategory = @category.products.where('title LIKE ?', "%#{params[:search_term]}%").order(:title).page(params[:page]).per(12)
  end
end
