# == Schema Information
#
# Table name: stripe_user_details
#
#  id                          :integer          not null, primary key
#  person_id                   :string(255)
#  stripe_account_id           :text(65535)
#  account                     :text(65535)
#  external_accounts           :text(65535)
#  details_submitted           :string(255)
#  secret_key                  :string(255)
#  all_keys                    :text(65535)
#  publishable_key             :string(255)
#  legal_entity                :text(65535)
#  address                     :text(65535)
#  country                     :string(255)
#  personal_address            :text(65535)
#  personal_id_number_provided :string(255)
#  ssn_last_4_provided         :string(255)
#  account_type                :string(255)
#  legal_entity_verification   :text(65535)
#  account_status              :string(255)
#  managed_type                :string(255)
#  transfers_enabled           :string(255)
#  verification                :text(65535)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  business_logo               :string(255)
#  business_name               :string(255)
#  business_url                :string(255)
#  decline_charge_on           :text(65535)
#

class StripeUserDetail < ActiveRecord::Base
	include ActiveModel::Model
    attr_accessor :city, :line1, :line2, :postal_code, :state, :dob
	
	
	serialize :account, JSON
	serialize :external_accounts, JSON
	serialize :all_keys, JSON
	serialize :legal_entity, JSON
	serialize :legal_entity_verification, JSON
	serialize :verification, JSON
	serialize :address, JSON
	serialize :personal_address, JSON

	belongs_to :person

end
