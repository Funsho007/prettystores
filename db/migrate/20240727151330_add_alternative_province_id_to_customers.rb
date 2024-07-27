class AddAlternativeProvinceIdToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :alternative_province_id, :integer
    add_foreign_key :customers, :provinces, column: :alternative_province_id
  end
end
