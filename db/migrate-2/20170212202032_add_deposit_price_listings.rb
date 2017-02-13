class AddDepositPriceListings < ActiveRecord::Migration
  def change
  	add_column :listings, :deposit_price_cents, :integer
  end
end
