class CreateStripeUserDetails < ActiveRecord::Migration
  def change
    create_table :stripe_user_details do |t|
      t.string :person_id
      t.text :stripe_account_id
      t.text :account
      t.text :external_accounts
      t.string :details_submitted
      t.string :secret_key
      t.text :all_keys
      t.string :publishable_key
      t.text  :legal_entity
      t.text :address
      t.string :country
      t.text :personal_address
      t.string :personal_id_number_provided
      t.string :ssn_last_4_provided
      t.string :account_type
      t.text   :legal_entity_verification
      t.string :account_status
      t.string :managed_type
      t.string :transfers_enabled
      t.text :verification


      t.timestamps null: false
    end
  end
end
