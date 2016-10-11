module StripeService
  module Payments
    CommunityModel = ::Community

    module Command
      module_function

      def capture_charge(transaction_id, community_id)
        transaction = Transaction.find(transaction_id)
        community = Community.find(community_id)
        stripe_charge_id = transaction.payment.stripe_transaction_id

        Stripe.api_key = transaction.payment.payment_gateway.stripe_secret_key
        result, error = nil, nil
        begin
          charge = Stripe::Charge.retrieve(stripe_charge_id)
          result = charge.capture

        rescue Stripe::InvalidRequestError => e
          error = e.message
        rescue Exception => e
          error = e.message
        end

        if result and result.status == "succeeded"
          BTLog.info("=================================================================================")
          BTLog.info("Submitted authorized payment #{transaction_id} to settlement")
          BTLog.info("=================================================================================")
        else
          BTLog.error("=================================================================================")
          BTLog.error("Could not submit authorized payment #{transaction_id} to settlement (#{error})")
          BTLog.error("=================================================================================")
        end

        return result, error
      end

      def void_transaction(transaction_id, community_id)
        transaction = Transaction.find(transaction_id)
        community = Community.find(community_id)

        stripe_charge_id = transaction.payment.stripe_transaction_id


        Stripe.api_key = transaction.payment.payment_gateway.stripe_secret_key
        result, error = nil, nil
        begin
          ch = Stripe::Charge.retrieve(stripe_charge_id)
          result = ch.refunds.create(:reverse_transfer => true)
          # result = Stripe::Refund.create(charge: stripe_charge_id, :reverse_transfer => true)
        rescue Stripe::InvalidRequestError => e
          error = e.message
        rescue Exception => e
          error = e.message
        end

        if result and result.status == "succeeded"
          BTLog.info("=================================================================================")
          BTLog.info("Voided transaction #{transaction_id}")
          BTLog.info("=================================================================================")
        else
          BTLog.error("=================================================================================")
          BTLog.error("Could not void transaction #{transaction_id}. #{error}")
          BTLog.error("=================================================================================")
        end

        return result, error
      end
    end

  end
end