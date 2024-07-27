ActiveAdmin.register Order do
  permit_params :customer_id, :order_date, :gst, :pst, :hst, :qst, :total_amount, :status
end
