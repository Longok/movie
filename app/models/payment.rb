class Payment < ApplicationRecord
  # after_create :generate_qr_code

  belongs_to :booking
  belongs_to :user

  # has_one_attached :qr_code
  
  validates :code, :cash_number, presence: true, length: {minimum: 5}

  PAYMENT_TYPE = ["Thanh toán Momo", "Thanh toán VNpay", "Thanh toán Paypal"]
  validates :payment_type, :inclusion => PAYMENT_TYPE

  def update_status
    self.booking.seat.status = true
    self.booking.seat.save
  end


  require 'rqrcode'
  def generate_qr_code
    qr_code = RQRCode::QRCode.new(code)
    qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6
    )
  end
  # def generate_qr_code
  #   qrcode = RQRCode::QRCode.new(code)
  #   png = qrcode.as_png(
  #     bit_depth: 1,
  #     border_modules: 4,
  #     color_mode: ChunkyPNG::COLOR_GRAYSCALE,
  #     color: "black",
  #     file: nil,
  #     fill: "white",
  #     module_px_size: 6,
  #     resize_exactly_to: false,
  #     resize_gte_to: false,
  #     size: 120
  #   )

  #   image_name = SecureRandom.hex
  #   IO.binwrite("storage/#{image_name}.png", png.to_s)

  #   blob = ActiveStorage::Blob.create_after_upload!(
  #     io: File.open("storage/#{image_name}.png"),
  #     filename: image_name,
  #     content_type: 'png'
  #   )
  #   self.qr_code.attach(blob)
  # end
  
end
