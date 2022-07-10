class HomeController < ApplicationController
  def index
    @films = Film.all.order("id DESC")
  end

  def show_titket
    if session[:lasted_payment_id]
      payment = Payment.find(session[:lasted_payment_id])
      redirect_to booking_payment_path(payment.booking_id, payment.id)
    end
  end
end
