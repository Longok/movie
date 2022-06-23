class Payment < ApplicationRecord
  belongs_to :booking
  belongs_to :user


  validates :code, :payment_type, :cash_number, presence: true, length: {minimum: 5}

  PAYMENT_TYPE = ["Thanh toán bằng Momo", "Thanh toán VNpay", "Thanh toán Paypal"]
  validates :payment_type, :inclusion => PAYMENT_TYPE 

end
