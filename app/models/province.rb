# app/models/province.rb
class Province < ApplicationRecord
  has_many :customers

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at gst hst id name pst qst tax_type updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[customers]
  end
end
