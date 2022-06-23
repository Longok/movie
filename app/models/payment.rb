class Payment < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  require 'rqrcode'

  validates :code, :cash_number, presence: true, length: {minimum: 5}

  PAYMENT_TYPE = ["Thanh toán Momo", "Thanh toán VNpay", "Thanh toán Paypal"]
  validates :payment_type, :inclusion => PAYMENT_TYPE 

  def update_status
    self.booking.seat.status = true
    self.booking.seat.save
  end

end
