class PaymentsController < ApplicationController
    

    def index
        @payments = Payment.all.order("id DESC")
    end

    def new
        @booking = Booking.find params[:booking_id]
        @payment = @booking.payments.build
    end

    def create
        @booking = Booking.find params[:booking_id]
        @payment = @booking.payments.new payment_params
        @payment.user_id = current_user.id
        if  @payment.save
            @payment.update_status

            flash[:info] = "Cảm ơn bạn đã đặt vé xem phim tại Movie App"
            redirect_to booking_payment_path(@payment, booking_id: @booking.id)
        else
            flash[:danger] = "Thanh toán thất bại"
            render :new
        end
    end

    def show
        @payment = Payment.find params[:id]
        qr_code = RQRCode::QRCode.new(@payment.code)
        @svg = qr_code.as_svg(
            offset: 0,
            color: '000',
            shape_rendering: 'crispEdges',
            module_size: 6
          )
    end

    private
    def payment_params
        params.require(:payment).permit :user_id, :booking_id, :code, :payment_type, :cash_number
    end
end
