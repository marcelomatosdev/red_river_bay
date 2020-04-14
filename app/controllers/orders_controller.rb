# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count
  before_action :select_province

  def index
    # @province = Province.all
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_back(fallback_location: root_path)
    # redirect_to root_path #:back
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_back(fallback_location: root_path)
  end

  def select_province
    @province = Province.where('name LIKE ?', "%#{params[:province]}%")
  end

  private

  def initialize_session
    session[:visit_count] ||= 0
    session[:cart] ||= []
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end
