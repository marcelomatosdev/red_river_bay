# frozen_string_literal: true

class User < ApplicationRecord
  has_many :products
  has_many :addresses

  validates :username, :email, :first_name, :last_name, presence: true
end
