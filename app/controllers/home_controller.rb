class HomeController < ApplicationController
  def index
<<<<<<< HEAD
    # @films = Film.with_attached_image.order("id DESC")
    @pagy, @films = pagy(Film.with_attached_image.order("id DESC"), items: 8)

=======
    @films = Film.with_attached_image.order("id DESC")
>>>>>>> 91b33aaf1c7506e96cf44834259fa99ce3978bc0
  end

  def show_titket
    if session[:lasted_payment_id] && current_user
      payment = Payment.find(session[:lasted_payment_id])
      redirect_to booking_payment_path(payment.booking_id, payment.id)
    end
  end
end
