class AddProvinceReferencesToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_reference :customers, :primary_province, foreign_key: { to_table: :provinces }
    add_reference :customers, :alternative_province, foreign_key: { to_table: :provinces }, null: true
  end
end
