ActiveAdmin.register Room do
    permit_params :name
  
    index do
      selectable_column
      column :id
      column "Tên phòng", :name
      column "Ngày tạo", :created_at
      actions
    end
  
  end