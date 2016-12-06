require "rails_helper"

RSpec.describe "Create payment", :type => :request do

  it "creates a payment" do
    Loan.create(funded_amount: 100.00, outstanding_balance: 100.00)
    headers = {
      "ACCEPT" => "application/json",
    }
    post "/payments", { :payment => {:loan_id => 1, :amount => 10.00} }, headers
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response['amount']).to eq('10.0')
  end

end
