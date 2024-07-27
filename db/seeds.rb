require 'faker'

# Provinces data
provinces = [
  { name: "Ontario", tax_type: "HST", gst: 0.05, pst: 0.08, hst: 0.13, qst: 0.0 },
  { name: "Quebec", tax_type: "QST", gst: 0.05, pst: 0.0, hst: 0.0, qst: 0.09975 },
  { name: "British Columbia", tax_type: "PST", gst: 0.05, pst: 0.07, hst: 0.0, qst: 0.0 }
]

provinces.each do |province|
  Province.find_or_create_by!(province)
end

# Brands
brands = ["Brand A", "Brand B", "Brand C"]
brands.each do |name|
  Brand.find_or_create_by!(name: name)
end

# Types
types = ["Lipstick", "Eyeliner", "Foundation"]
types.each do |name|
  Type.find_or_create_by!(name: name)
end

# Tags
tags = ["Vegan", "Cruelty-Free", "Organic"]
tags.each do |name|
  Tag.find_or_create_by!(name: name)
end

# Categories and Products
categories = ["Makeup", "Skincare", "Fragrance", "Hair"]
categories.each do |category_name|
  category = Category.find_or_create_by!(name: category_name)

  # Specific products
  Product.create!(
    name: "Product 1",
    description: "Description for product 1",
    price: 19.99,
    category: category,
    brand: Brand.order('RANDOM()').first,
    type: Type.order('RANDOM()').first,
    image: File.open(Rails.root.join("public/images/placeholder.jpg")),
    on_sale_status: [true, false].sample
  )

  Product.create!(
    name: "Product 2",
    description: "Description for product 2",
    price: 29.99,
    category: category,
    brand: Brand.order('RANDOM()').first,
    type: Type.order('RANDOM()').first,
    image: File.open(Rails.root.join("public/images/placeholder.jpg")),
    on_sale_status: [true, false].sample
  )

  Product.create!(
    name: "Product 3",
    description: "Description for product 3",
    price: 39.99,
    category: category,
    brand: Brand.order('RANDOM()').first,
    type: Type.order('RANDOM()').first,
    image: File.open(Rails.root.join("public/images/placeholder.jpg")),
    on_sale_status: [true, false].sample
  )

  22.times do
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

# Customers
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

# Pages
pages = [
  { title: "About Us", content: "This is the about page." },
  { title: "Contact Us", content: "This is the contact page." }
]

pages.each do |page_data|
  Page.find_or_create_by!(title: page_data[:title]) do |page|
    page.content = page_data[:content]
  end
end

# Ensure admin user exists
AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end

puts "Database seeded successfully!"
