# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_cart
  protect_from_forgery with: :null_session

  private

  def load_cart
    session[:cart] ||= []
    @cart = Product.find(session[:cart])
  end
end
