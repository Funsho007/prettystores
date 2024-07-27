ActiveAdmin.register OrderItem do
  permit_params :product_id, :order_id, :quantity, :price
end
