# app/models/customer.rb
class Customer < ApplicationRecord
  has_many :orders
  belongs_to :primary_province, class_name: 'Province', optional: true
  belongs_to :alternative_province, class_name: 'Province', optional: true

  def self.ransackable_associations(auth_object = nil)
    %w[orders primary_province alternative_province]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[first_name last_name primary_address primary_city primary_postal_code alternative_address alternative_city alternative_postal_code created_at updated_at]
  end
end
