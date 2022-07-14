class HomeController < ApplicationController
  def index
    @films = Film.with_attached_image.order("id DESC")
  end

  def show_titket
    if session[:lasted_payment_id] && current_user
      payment = Payment.find(session[:lasted_payment_id])
      redirect_to booking_payment_path(payment.booking_id, payment.id)
    end
  end
end
