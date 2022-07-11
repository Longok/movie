class CheckoutController < ApplicationController

    def create
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [
                {price: 'price_1LKkR7K8qEZum66gPKqv7JV0', quantity: 1},
            ],
            mode: 'subscription',
            success_url: 'http://127.0.0.1:3000/titket',
            cancel_url: 'http://127.0.0.1:3000',
        })
        respond_to do |format|
            format.js
        end
    end

end    