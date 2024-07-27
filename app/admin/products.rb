ActiveAdmin.register Product do
  permit_params :name, :description, :price, :image, :category_id

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :description
      f.input :price
      f.input :image, as: :file
    end
    f.actions
  end
end
