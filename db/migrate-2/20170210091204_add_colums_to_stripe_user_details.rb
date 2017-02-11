class AddColumsToStripeUserDetails < ActiveRecord::Migration
  def change
  	add_column :stripe_user_details, :business_logo, :string
  	add_column :stripe_user_details, :business_name, :string
  	add_column :stripe_user_details, :business_url, :string
  	add_column :stripe_user_details, :decline_charge_on, :text
  end
end
