class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.date :order_date
      t.float :gst
      t.float :pst
      t.float :hst
      t.float :qst
      t.float :total_amount
      t.string :status

      t.timestamps
    end
  end
end
