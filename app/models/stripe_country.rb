# == Schema Information
#
# Table name: stripe_countries
#
#  id           :integer          not null, primary key
#  country_name :string(255)
#  country_code :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class StripeCountry < ActiveRecord::Base
end
