# == Schema Information
#
# Table name: stripe_payments
#
#  id                    :integer          not null, primary key
#  payer_id              :string(255)
#  recipient_id          :string(255)
#  organization_id       :string(255)
#  transaction_id        :integer
#  status                :string(255)
#  community_id          :integer
#  sum_cents             :integer
#  currency              :string(255)
#  stripe_transaction_id :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class StripePayment < ActiveRecord::Base
  monetize :sum_cents, allow_nil: true, with_model_currency: :currency

  def sum_exists?
    !sum_cents.nil?
  end

  def total_sum
    sum
  end

  # Build default payment sum by listing
  # Note: Consider removing this :(
  def default_sum(listing, vat=0)
    self.sum = listing.price
  end
end
