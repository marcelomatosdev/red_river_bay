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
        amount: order.total.to_i,
        currency: 'cad',
        quantity: 1
      }],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end
  end

  def success
    @order = Order.find(session[:s_order])
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @order.update(stripe_id: @payment_intent.id, status: 'paid')
  end

  def cancel; end
end
