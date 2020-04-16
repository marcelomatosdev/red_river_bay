# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    order = Order.find(session[:s_order])

    if order.nil?
      redirect_to pre_checkout_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: order.user_id,
        amount: order.total,
        currency: 'cad',
        quantity: 1
      }],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end
  end

  def success; end

  def cancel; end
end
