class Payment < ActiveRecord::Base
  def valid_amount(loan)
    loan ||= Loan.new(funded_amount: 0, outstanding_balance: 0)
    if self.amount < loan.outstanding_balance
      true
    else
      false
    end
  end

  def update_loan(loan)
    new_balance = loan.outstanding_balance - self.amount
    loan.update!(outstanding_balance: new_balance)
  end
end
