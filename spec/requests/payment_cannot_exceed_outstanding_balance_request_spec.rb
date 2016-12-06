require 'rails_helper'

describe 'payments cannot exceed outstanding balances' do
  it 'has multiple payments' do
    loan = Loan.create(funded_amount: 100.00, outstanding_balance: 100.00)
    headers = {
      "ACCEPT" => "application/json",
    }
    post "/payments", { :payment => {:loan_id => 1, :amount => 10.00} }, headers
    post "/payments", { :payment => {:loan_id => 1, :amount => 100.00} }, headers

    expect(JSON.parse(response.body)).to eq({"Error"=>"Payment exceeds loan balance"})
  end
end
