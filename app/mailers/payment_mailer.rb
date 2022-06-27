class PaymentMailer < ApplicationMailer
  def create
    @user = params[:user]
    @payment = params[:payment]

    mail to: @user.email,
    subject: "Đặt vé thành công"
  end
end
