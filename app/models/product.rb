# app/models/product.rb
class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :type
  has_and_belongs_to_many :tags
  has_many :order_items
  has_many :orders, through: :order_items
  mount_uploader :image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    %w[brand_id category_id created_at description id image name on_sale_status price type_id updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category brand type tags order_items orders]
  end
end
