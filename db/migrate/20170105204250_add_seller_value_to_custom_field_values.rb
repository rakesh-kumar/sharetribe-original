class AddSellerValueToCustomFieldValues < ActiveRecord::Migration
  def change
  	add_column :custom_field_values, :seller_value, :text, :after => :buyer_value
  end
end
