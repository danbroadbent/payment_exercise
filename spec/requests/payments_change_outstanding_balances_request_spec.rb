require 'rails_helper'

describe 'loans have outstanding balances' do
  it 'has multiple payments' do
    loan = Loan.create(funded_amount: 100.00, outstanding_balance: 100.00)
    headers = {
      "ACCEPT" => "application/json",
    }
    post "/payments", { :payment => {:loan_id => 1, :amount => 10.00} }, headers
    post "/payments", { :payment => {:loan_id => 1, :amount => 20.00} }, headers

    expect(Loan.first.outstanding_balance).to eq(70.00)
  end
end
