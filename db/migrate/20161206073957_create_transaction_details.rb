class CreateTransactionDetails < ActiveRecord::Migration
  def change
    create_table :transaction_details do |t|
      t.string  :product_name
      t.text    :description
      t.decimal :recommended_retail_price
      t.decimal :wholesale_price
      t.attachment :image_one
      t.attachment :image_two
      t.attachment :image_three
      t.attachment :image_four
      t.attachment :image_five
      t.integer :transaction_id

      t.timestamps null: false
    end
  end
end
