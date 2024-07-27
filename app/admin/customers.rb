# app/admin/customers.rb
ActiveAdmin.register Customer do
  permit_params :first_name, :last_name, :primary_address, :primary_city, :primary_postal_code,
                :alternative_address, :alternative_city, :alternative_postal_code,
                :primary_province_id, :alternative_province_id

  form do |f|
    f.inputs 'Customer Details' do
      f.input :first_name
      f.input :last_name
      f.input :primary_address
      f.input :primary_city
      f.input :primary_province
      f.input :primary_postal_code
      f.input :alternative_address
      f.input :alternative_city
      f.input :alternative_province
      f.input :alternative_postal_code
    end
    f.actions
  end
end
