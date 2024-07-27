class Tag < ApplicationRecord
  has_and_belongs_to_many :products

  def self.ransackable_associations(auth_object = nil)
    %w[products]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id id_value name updated_at]
  end
end
