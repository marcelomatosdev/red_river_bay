# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_cart

  private

  def load_cart
    @cart = Product.find(session[:cart])
  end
end
