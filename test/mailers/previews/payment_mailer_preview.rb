# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/create
  def create
    PaymentMailer.with(user: User.find_by(params[:id]), payment: Payment.find_by(params[:id])).create
  end

end
