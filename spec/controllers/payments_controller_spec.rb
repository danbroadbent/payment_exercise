require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#index' do
    it 'responds with a 200' do
      loan = Loan.create(funded_amount: 100.00, outstanding_balance: 100.00)
      payment = Payment.create(amount: 10.0, loan_id: loan.id)
      payment = Payment.create(amount: 20.0, loan_id: loan.id)

      get :index
      expect(JSON.parse(response.body).count).to eq(Payment.all.count)
    end
  end

  describe '#show' do
    loan = Loan.create(funded_amount: 100.00, outstanding_balance: 100.00)
    payment = Payment.create!(amount: 10.0, loan_id: loan.id)

    it 'responds with a 200' do
      get :show, id: payment.id
      expect(response).to have_http_status(:ok)
    end

    context 'if the payment is not found' do
      it 'responds with a 404' do
        get :show, id: 10000
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
