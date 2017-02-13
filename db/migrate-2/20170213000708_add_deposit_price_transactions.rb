class AddDepositPriceTransactions < ActiveRecord::Migration
  def change
  	add_column :transactions, :unit_deposit_price_cents, :integer
  end
end
