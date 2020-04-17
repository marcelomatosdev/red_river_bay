# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    order = Order.find(session[:s_order])

    if order.nil?
      redirect_to pre_checkout_path
      return
    end
    user = User.find(order.user_id)
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: user.email,
        amount: order.total.to_i * 100,
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

    @cart.each do |product|
      OrderProduct.create(order_id: @order.id, product_id: product.id, price: product.price, quantity: product.quantity)
      session[:invoice_product] << product.id
    end

    @invoiceProductList = Product.find(session[:invoice_product])
    @cart = nil
    session.delete :cart
  end

  def cancel
    redirect_to pre_checkout_path
  end
end
