class PaymentsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Payment.all
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    loan = Loan.find(params['payment']['loan_id'])
    payment = Payment.new(payment_params)
    if payment.amount < loan.outstanding_balance
      if payment.save
        new_balance = loan.outstanding_balance - payment.amount
        loan.update!(outstanding_balance: new_balance)
        render json: payment
      else
        render payment.errors
      end
    else
      render json: {'Error': 'Payment exceeds loan balance'}
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:loan_id, :amount)
  end
end
