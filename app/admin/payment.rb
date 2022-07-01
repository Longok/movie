ActiveAdmin.register Payment do
    permit_params :booking_id, :user, :code, :payment_type, :cash_number

    index do
      selectable_column
      column :id
      column :booking_id
      column "Tên", :user.name
      column "Mã code", :code
      column "Hình thức thanh toán", :payment_type
      column "Số tiền", :cash_number
      column "Ngày đặt", :created_at
      actions
    end
  
  end