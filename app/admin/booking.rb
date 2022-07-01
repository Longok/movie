ActiveAdmin.register Booking do
    permit_params :seat
  
    index do
      selectable_column
      column :id
      column "Ghế", :seat.name
      column "Ngày tạo", :created_at
      actions
    end
  
  end