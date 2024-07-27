# db/seeds.rb
require 'faker'

# Provinces data
provinces = [
  { name: "Ontario", tax_type: "HST", gst: 0.05, pst: 0.08, hst: 0.13, qst: 0.0 },
  { name: "Quebec", tax_type: "QST", gst: 0.05, pst: 0.0, hst: 0.0, qst: 0.09975 },
  { name: "British Columbia", tax_type: "PST", gst: 0.05, pst: 0.07, hst: 0.0, qst: 0.0 }
]

provinces.each { |province| Province.find_or_create_by!(province) }

# Create other records...
brands = ["Brand A", "Brand B", "Brand C"]
brands.each { |name| Brand.find_or_create_by!(name: name) }

types = ["Lipstick", "Eyeliner", "Foundation"]
types.each { |name| Type.find_or_create_by!(name: name) }

tags = ["Vegan", "Cruelty-Free", "Organic"]
tags.each { |name| Tag.find_or_create_by!(name: name) }

categories = ["Makeup", "Skincare", "Fragrance", "Hair"]
categories.each do |category_name|
  category = Category.find_or_create_by!(name: category_name)
  25.times do
    product = Product.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price(range: 10..100.0),
      category: category,
      brand: Brand.order('RANDOM()').first,
      type: Type.order('RANDOM()').first,
      image: File.open(Rails.root.join("public/images/placeholder.jpg")),
      on_sale_status: [true, false].sample
    )
    product.tags << Tag.order('RANDOM()').first
  end
end

10.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    primary_address: Faker::Address.street_address,
    primary_city: Faker::Address.city,
    primary_province: Province.order('RANDOM()').first,
    primary_postal_code: Faker::Address.zip_code,
    alternative_address: Faker::Address.street_address,
    alternative_city: Faker::Address.city,
    alternative_province: Province.order('RANDOM()').first,
    alternative_postal_code: Faker::Address.zip_code,
    password: Faker::Internet.password(min_length: 8)
  )
end

Page.find_or_create_by!(title: "About Us") do |page|
  page.content = "This is the about page."
end

Page.find_or_create_by!(title: "Contact Us") do |page|
  page.content = "This is the contact page."
end

# Ensure admin user exists
AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end
