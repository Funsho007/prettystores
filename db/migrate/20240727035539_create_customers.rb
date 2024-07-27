class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :primary_address
      t.string :primary_city
      t.string :primary_province
      t.string :primary_postal_code
      t.string :alternative_address
      t.string :alternative_city
      t.string :alternative_province
      t.string :alternative_postal_code
      t.string :password

      t.timestamps
    end
  end
end
