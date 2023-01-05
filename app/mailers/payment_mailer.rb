class PaymentMailer < ApplicationMailer
  def create
    @user = params[:user]
    @payment = params[:payment]
    
    attachments.inline['galaxy-logo.png'] = File.read(Rails.root.join("app/assets/images/galaxy-logo.png"))
    @filename = @payment.booking.showtime.film.to_s + @payment.booking.showtime.film.image.filename.extension_with_delimiter

    attachments.inline[@filename] = @payment.booking.showtime.film.image.download
    
    mail to: @user.email,
    subject: "Đặt vé thành công"

  end
end
