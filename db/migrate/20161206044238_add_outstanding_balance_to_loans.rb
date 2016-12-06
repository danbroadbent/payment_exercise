class AddOutstandingBalanceToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :outstanding_balance, :decimal
  end
end
