class User < ApplicationRecord

  has_many :products
  has_many :addresses
end
