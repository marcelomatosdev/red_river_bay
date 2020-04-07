# frozen_string_literal: true

require 'open-uri'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Product.destroy_all
# create_table "products", force: :cascade do |t|
#   t.string "title"
#   t.text "description"
#   t.string "price"
#   t.string "quantity"
#   t.integer "user_id", null: false
#   t.integer "category_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["category_id"], name: "index_products_on_category_id"
#   t.index ["user_id"], name: "index_products_on_user_id"
# end

NUMBER_OF_PRODUCTS = 1

NUMBER_OF_PRODUCTS.times do
  rand_user = User.order('RANDOM()').first
  rand_category = Category.order('RANDOM()').first
  new_product = Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentences,
    price: rand(3..348),
    quantity: rand(1..27),
    user_id: rand_user.id,
    category_id: rand_category.id
  )
  downloaded_image = open(URI.escape("https://source.unsplash.com/600x600/?#{new_product.title}"))
  new_product.image.attach(io: downloaded_image, filename: "m-#{new_product.title}.jpg")
  sleep(1)
end

puts "Created #{Product.count} products."

# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# end
