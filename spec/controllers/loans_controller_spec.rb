require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  describe '#index' do
    let(:loan) { Loan.create!(funded_amount: 200.0, outstanding_balance: 200.0) }

    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'shows the outstanding balance' do
      get :show, id: loan.id
      expect(JSON.parse(response.body)['outstanding_balance']).to eq("200.0")
    end
  end

  describe '#show' do
    let(:loan) { Loan.create!(funded_amount: 200.0, outstanding_balance: 200.0) }

    it 'responds with a 200' do
      get :show, id: loan.id
      expect(response).to have_http_status(:ok)
    end

    it 'shows the outstanding balance' do
      get :show, id: loan.id
      expect(JSON.parse(response.body)['outstanding_balance']).to eq("200.0")
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, id: 10000
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
