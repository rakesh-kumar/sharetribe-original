class CreateStripeCountries < ActiveRecord::Migration
  def change
    create_table :stripe_countries do |t|
      t.string :country_name
      t.string :country_code

      t.timestamps null: false
    end
  end
end
