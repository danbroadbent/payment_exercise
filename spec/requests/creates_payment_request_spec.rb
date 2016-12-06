require "rails_helper"

RSpec.describe "Create payment", :type => :request do

  it "creates a payment" do
    loan = Loan.create(funded_amount: 1000.00, outstanding_balance: 1000.00)
    headers = {
      "ACCEPT" => "application/json",
    }
    post "/payments", { :payment => {:loan_id => loan.id, :amount => 500.00} }, headers

    expect(response.content_type).to eq("application/json")
    expect(JSON.parse(response.body)['amount']).to eq('500.0')
  end

end
