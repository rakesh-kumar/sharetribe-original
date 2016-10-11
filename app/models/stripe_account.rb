# == Schema Information
#
# Table name: stripe_accounts
#
#  id                    :integer          not null, primary key
#  person_id             :string(255)
#  publishable_key       :string(255)
#  secret_key            :string(255)
#  stripe_user_id        :string(255)
#  currency              :string(255)
#  stripe_account_type   :string(255)
#  stripe_account_status :text(65535)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class StripeAccount < ActiveRecord::Base
end
