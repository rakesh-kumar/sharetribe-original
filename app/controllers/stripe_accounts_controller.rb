class StripeAccountsController < ApplicationController
  before_filter do |controller|
    controller.ensure_logged_in t("layouts.notifications.you_must_log_in_to_view_your_settings")
  end

  before_filter :ensure_stripe_enabled

  def index
    @selected_left_navi_link = "payments"

    community_ready_for_payments = @current_community.stripe_in_use?
    unless community_ready_for_payments
      flash.now[:warning] = t("stripe_accounts.admin_account_not_connected",
                            contact_admin_link: view_context.link_to(
                              t("stripe_accounts.contact_admin_link_text"),
                                new_user_feedback_path)).html_safe
    end

    community_currency = @current_community.default_currency
    community_country_code = LocalizationUtils.valid_country_code(@current_community.country)

    Stripe.api_key = @current_community.payment_gateway.stripe_secret_key
    Stripe.api_version = '2015-04-07'
    @stripe_account_detail = if @current_user.stripe_account.present?
      Stripe::Account.retrieve(@current_user.stripe_account.try(:stripe_user_id)) rescue nil
    end
    @stripe_user_details = @current_user.stripe_user_detail

    render(locals: {
      community_ready_for_payments: community_ready_for_payments,
      left_hand_navigation_links: settings_links_for(@current_user, @current_community),
      currency: community_currency,
    })
  end

  def oauth
    connector = StripeOauth.new( @current_user, @current_community )
    url, error = connector.oauth_url( redirect_uri: stripe_confirm_url(locale: nil) )
    if url.nil?
      flash[:error] = error
      redirect_to stripe_account_settings_payment_path( @current_user )
    else
      redirect_to url
    end
  end

  # Creating a Stripe managed account
  def create_stripe_account
    
    country =  StripeCountry.find(params[:country_id])
    Stripe.api_key = @current_community.payment_gateway.stripe_secret_key
    @stripe_account = Stripe::Account.create(
      {
        :country => 'US',
        :managed => true
      }
    )
     idddddd  =  @stripe_account.id
     @stripe_user_details = StripeUserDetail.new
     @stripe_user_details.person_id = @current_user.id
     @stripe_user_details.stripe_account_id = idddddd 
     @stripe_user_details.account = @stripe_account.object 
     @stripe_user_details.external_accounts = @stripe_account.external_accounts 
     @stripe_user_details.details_submitted = @stripe_account.details_submitted 
     @stripe_user_details.secret_key = @stripe_account.keys.secret
     @stripe_user_details.publishable_key = @stripe_account.keys.publishable 
     @stripe_user_details.all_keys = @stripe_account.keys
     @stripe_user_details.legal_entity = @stripe_account.legal_entity 
     @stripe_user_details.address = @stripe_account.legal_entity.address 
     @stripe_user_details.country = @stripe_account.legal_entity.address.country 
     @stripe_user_details.personal_address = @stripe_account.legal_entity.personal_address 
     @stripe_user_details.personal_id_number_provided = @stripe_account.legal_entity.personal_id_number_provided 
     @stripe_user_details.ssn_last_4_provided = @stripe_account.legal_entity.ssn_last_4_provided
     @stripe_user_details.account_type = @stripe_account.legal_entity.type 
     @stripe_user_details.legal_entity_verification = @stripe_account.legal_entity.verification 
     @stripe_user_details.account_status = @stripe_account.legal_entity.verification.status 
     @stripe_user_details.managed_type = @stripe_account.managed
     @stripe_user_details.transfers_enabled = @stripe_account.transfers_enabled 
     @stripe_user_details.verification = @stripe_account.verification

     @stripe_user_details.save
     redirect_to :back
 
  end

  def update_stripe_user_details
   
      Stripe.api_key = @current_community.payment_gateway.stripe_secret_key
      
      stripe_account = Stripe::Account.retrieve(@current_user.stripe_user_detail.stripe_account_id)

      city = params[:stripe_user_detail][:city] rescue ''
      address_line = params[:stripe_user_detail][:line1] rescue ''
      postal_code = params[:stripe_user_detail][:postal_code].delete(' ') rescue ''
      state = params[:stripe_user_detail][:state] rescue ''
      begin
        addressInput = {
            'city' => city,
            'country' => 'US',
            'line1' => address_line,
            # 'line2' => !params[:user][:address].blank? ? params[:user][:address] : nil,
            'postal_code' => postal_code,
            'state' => state
        }

        # birth = params[:user][:birthday].to_date rescue nil
        st_year  = params[:stripe_user_detail]["dob(1i)"] rescue ''
        st_month = params[:stripe_user_detail]["dob(2i)"] rescue ''
        st_day   = params[:stripe_user_detail]["dob(3i)"] rescue '' 
        dob = {year: st_year, month: st_month, day: st_day} rescue {}
        
        # legalEntityInput = {
        #     'address' => addressInput,
        #     'dob' => dob,
        #     'first_name' => params[:stripe_user_detail][:first_name].delete(' '),
        #     'last_name' => params[:stripe_user_detail][:last_name].delete(' '),
        #     'personal_address' => addressInput,
        #     'type' => 'individual'
        # }

        # externalAccountInput = {
        #     'object' => 'bank_account',
        #     'country' => 'us',
        #     'currency' => 'usd',
        #     'account_holder_name' => params[:stripe_user_detail][:account_holder_name],
        #     'routing_number' => params[:stripe_user_detail][:routing_number].delete(' '),
        #     'account_number' => params[:stripe_user_detail][:account_number].delete(' ')
        # }

        # token_obj =  Stripe::Token.create(
        #   :bank_account => {
        #     :country => "US",
        #     :currency => "usd",
        #     :account_holder_name => params[:stripe_user_detail][:account_holder_name],
        #     :account_holder_type => "individual",
        #     :routing_number =>  params[:stripe_user_detail][:routing_number].delete(' '),
        #     :account_number =>  params[:stripe_user_detail][:account_number].delete(' '),
        #   },
        # )

        # data = external_accounts.create(:external_account => token_obj.id)
        # data =  [{
        #           "object" => "bank_account",
        #           "account" => @current_user.stripe_user_detail.stripe_account_id,
        #           "account_holder_name" => params[:stripe_user_detail][:account_holder_name],
        #           "account_holder_type" => "individual",
        #           "bank_name" => params[:stripe_user_detail][:bank_name],
        #           "country" => "US",
        #           "currency" => "usd",
        #           "default_for_currency" => false,
        #           "routing_number" => params[:stripe_user_detail][:routing_number].delete(' '),
        #           'account_number' => params[:stripe_user_detail][:account_number].delete(' '),
        #           "status" => "update"
        #         }]

        # stripe_account.email = @current_user.email rescue '' 
        stripe_account.business_name = params[:stripe_user_detail][:business_name]
        stripe_account.business_url  = params[:stripe_user_detail][:business_url]

        stripe_account.tos_acceptance.ip = request.remote_ip
        stripe_account.tos_acceptance.date = Time.now.to_i
        # stripe_account.external_accounts.data = data
        # stripe_account.legal_entity = legalEntityInput
        stripe_account.legal_entity.address.city = params[:stripe_user_detail][:city]
        stripe_account.legal_entity.address.line1 = params[:stripe_user_detail][:line1]
        stripe_account.legal_entity.address.line2 = params[:stripe_user_detail][:line2]
        stripe_account.legal_entity.address.postal_code = params[:stripe_user_detail][:postal_code]
        stripe_account.legal_entity.address.postal_code = params[:stripe_user_detail][:postal_code]
        stripe_account.legal_entity.address.state = params[:stripe_user_detail][:state]
        stripe_account.legal_entity.first_name    = params[:stripe_user_detail][:first_name]
        stripe_account.legal_entity.last_name     = params[:stripe_user_detail][:last_name]

        stripe_account.legal_entity.personal_address = addressInput
        stripe_account.legal_entity.dob.day     = st_day 
        stripe_account.legal_entity.dob.month   = st_month
        stripe_account.legal_entity.dob.year    = st_year
        stripe_account.save




      # stripe_account = Stripe::Account.retrieve(@current_user.stripe_user_detail.stripe_account_id)
      # stripe_account.business_name = params[:stripe_user_detail][:business_name]
      # stripe_account.business_url  = params[:stripe_user_detail][:business_url]
      # stripe_account.legal_entity.address.city = params[:stripe_user_detail][:city]
      # stripe_account.legal_entity.address.line1 = params[:stripe_user_detail][:line1]
      # stripe_account.legal_entity.address.line2 = params[:stripe_user_detail][:line2]
      # stripe_account.legal_entity.address.postal_code = params[:stripe_user_detail][:postal_code]
      # stripe_account.legal_entity.address.postal_code = params[:stripe_user_detail][:postal_code]
      # stripe_account.legal_entity.address.state = params[:stripe_user_detail][:state]
      # stripe_account.legal_entity.first_name    = params[:stripe_user_detail][:first_name]
      # stripe_account.legal_entity.last_name     = params[:stripe_user_detail][:last_name]

      # stripe_account.legal_entity.dob.day     = params[:stripe_user_detail]["dob(3i)"]
      # stripe_account.legal_entity.dob.month   = params[:stripe_user_detail]["dob(2i)"]
      # stripe_account.legal_entity.dob.year    = params[:stripe_user_detail]["dob(1i)"]
      # save
      # stripe_account.save

      if params[:stripe_user_detail][:document]
        attached_document = Stripe::FileUpload.create(
          {
            :purpose => 'identity_document',
            :file => File.new(params[:stripe_user_detail][:document].path)
          },
          {:stripe_account => stripe_account.id}
        )
        stripe_account.legal_entity.verification.document = attached_document.id
        stripe_account.save
      end

      user_details  = @current_user.stripe_user_detail
      user_details.business_name = stripe_account.business_name
      user_details.business_url  = stripe_account.business_url
      user_details.legal_entity  = stripe_account.legal_entity
      user_details.address        = stripe_account.legal_entity.address, 
      user_details.country        = stripe_account.legal_entity.address.country, 
      user_details.personal_address = stripe_account.legal_entity.personal_address, 
      user_details.personal_id_number_provided =  stripe_account.legal_entity.personal_id_number_provided, 
      user_details.ssn_last_4_provided =stripe_account.legal_entity.ssn_last_4_provided, 
      user_details.account_type        = stripe_account.legal_entity.type, 
      user_details.legal_entity_verification = stripe_account.legal_entity.verification, 
      user_details.account_status      = stripe_account.legal_entity.verification.status, 
      user_details.managed_type        = stripe_account.managed, 
      user_details.transfers_enabled   = stripe_account.transfers_enabled, 
      user_details.verification        = stripe_account.verification
      # user_details.bank_account_details = data

      user_details.save

      # save
      if stripe_account.legal_entity.verification.status == "verified"
        stripe_acc = StripeAccount.new(person_id: @current_user.id, 
          publishable_key: user_details.publishable_key, 
          secret_key: user_details.secret_key, stripe_user_id: user_details.stripe_account_id, 
          currency: stripe_account.country, stripe_account_type: 'string', 
          stripe_account_status: stripe_account.legal_entity.verification)
        
        stripe_acc.save
      end
    rescue => error
      flash[:error] = "An error occurred when verifying up your payment details: #{error.message}."
      return redirect_to :back
    end

    # flash[:notice] = "Awesome! Now that you've setup your account, go <a href='/en/listings/new'>here</a> to create a session now.".html_safe
    redirect_to :back
  end

  private

  # Before filter
  def ensure_stripe_enabled
    unless StripeHelper.stripe_active?(@current_community.id)
      flash[:error] = t("stripe_accounts.new.stripe_not_enabled")
      redirect_to person_settings_path(@current_user)
    end
  end

  def create_oauth_account_if_not_exists
    unless @current_user.stripe_account_connected?
      create_oauth_account
    end
  end

  def create_oauth_account
    Stripe.api_key = @current_community.payment_gateway.stripe_secret_key
    connector = StripeOauth.new( @current_user)
    url, error = connector.oauth_url( redirect_uri: stripe_confirm_url(locale: nil) )

    if url.nil?
      flash[:error] = error || "Unable to connect Stripe account!"
      return redirect_to root_url
    else
      # redirect_to url
    end
  end

  # Confirm a connection to a Stripe account.
  # Only works on the currently logged in user.
  # See app/services/stripe_connect.rb for #verify! details.
  def confirm
    connector = StripeOauth.new( current_user )
    if params[:code]
      # If we got a 'code' parameter. Then the
      # connection was completed by the user.
      connector.verify!( params[:code] )

    elsif params[:error]
      # If we have an 'error' parameter, it's because the
      # user denied the connection request. Other errors
      # are handled at #oauth_url generation time.
      flash[:error] = "Authorization request denied."
    end

    redirect_to root_url
  end

end