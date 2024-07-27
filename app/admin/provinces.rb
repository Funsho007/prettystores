ActiveAdmin.register Province do
  permit_params :name, :gst, :hst, :pst, :qst, :tax_type

  filter :name
  filter :gst
  filter :hst
  filter :pst
  filter :qst
  filter :tax_type
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :name
    column :gst
    column :hst
    column :pst
    column :qst
    column :tax_type
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :gst
      f.input :hst
      f.input :pst
      f.input :qst
      f.input :tax_type
    end
    f.actions
  end
end
