class CreateStripeRefunds < ActiveRecord::Migration
  def change
    create_table :stripe_refunds do |t|
      t.integer :stripe_payment_id
      t.text :stripe_refund_id
      t.integer :amount
      t.text :details

      t.timestamps null: false
    end
  end
end
