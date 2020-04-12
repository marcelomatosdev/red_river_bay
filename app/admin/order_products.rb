# frozen_string_literal: true

ActiveAdmin.register OrderProduct do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :price, :quantity, :order_id, :product_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:price, :quantity, :order_id, :product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
