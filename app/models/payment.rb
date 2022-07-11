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

  def generate_qr_code
    qr_code = RQRCode::QRCode.new(code)
    qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6
    )
  end
end
