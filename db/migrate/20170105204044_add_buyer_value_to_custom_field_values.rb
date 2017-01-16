class AddBuyerValueToCustomFieldValues < ActiveRecord::Migration
  def change
    add_column :custom_field_values, :buyer_value, :text, :after => :date_value
  end
end
