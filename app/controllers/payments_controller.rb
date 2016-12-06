class PaymentsController < ApplicationController
  def create
    payment = Payment.new(payment_params)
    if payment.save
      render json: payment
    else
      render 404
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:loan_id, :amount)
  end
end
