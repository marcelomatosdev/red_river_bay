# frozen_string_literal: true

ActiveAdmin.register Address do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :street, :city, :postal_code, :user_id, :province_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:street, :city, :postal_code, :user_id, :province_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
