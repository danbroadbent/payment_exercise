require 'rails_helper'

describe 'loans have payment' do
  it 'has one payment' do
    loan = Loan.create(funded_amount: 100.00)
    payment = loan.payments.create(amount: 10.00)

    expect(payment).to eq(loan.payments.first)
  end
end
