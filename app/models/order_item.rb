# app/models/order_item.rb
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id order_id price product_id quantity total updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[order product]
  end
end
