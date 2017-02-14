# == Schema Information
#
# Table name: stripe_refunds
#
#  id                :integer          not null, primary key
#  stripe_payment_id :integer
#  stripe_refund_id  :text(65535)
#  amount            :integer
#  details           :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class StripeRefund < ActiveRecord::Base
	belongs_to :stripe_payment
	serialize :details, JSON
end
