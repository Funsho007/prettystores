
class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :products, through: :order_items

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at customer_id gst hst id order_date pst qst status total_amount updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[customer order_items products]
  end
end
