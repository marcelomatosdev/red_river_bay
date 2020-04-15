# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count
  before_action :select_province

  def index
    # @province = Province.all
  end

  def pre_checkout_user
    new_user ||= User.create(username: params[:username], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
    new_user.addresses.create(user_id: new_user.id, province_id: session[:s_province], street: params[:street], city: params[:city], postal_code: params[:postal_code])
    redirect_back(fallback_location: root_path)
  end

  def pre_checkout_address
    new_user ||= User.create(user_params)
    # new_user.addresses.create(address_params) if new_user && address_params
    redirect_back(fallback_location: root_path)
  end

  def pre_checkout
    @province = Province.where('name LIKE ?', "%#{params[:province]}%")
    session[:s_province] = @province.first.id
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
    session[:s_province] ||= 0
    session[:cart] ||= []
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end

# <%= form_with(url: pre_checkout_user_path, local:true, method: "post") do |user_form|%>
#   <li>Username<%= user_form.text_field :username %></li>
#   <li>Email: <%= user_form.text_field :email%></li>
#   <li>First name: <%= user_form.text_field :first_name %></li>
#   <li>Last name : <%= user_form.text_field :last_name %></li>
# <%= submit_tag("Save user", class:"button is-info is-small") %>
# <% end %>
