class StripeCountriesController < ApplicationController
  before_action :set_stripe_country, only: [:show, :edit, :update, :destroy]

  # GET /stripe_countries
  def index
    @stripe_countries = StripeCountry.all
  end

  # GET /stripe_countries/1
  def show
  end

  # GET /stripe_countries/new
  def new
    @stripe_country = StripeCountry.new
  end

  # GET /stripe_countries/1/edit
  def edit
  end

  # POST /stripe_countries
  def create
    @stripe_country = StripeCountry.new(stripe_country_params)

    if @stripe_country.save
      redirect_to @stripe_country, notice: 'Stripe country was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stripe_countries/1
  def update
    if @stripe_country.update(stripe_country_params)
      redirect_to @stripe_country, notice: 'Stripe country was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stripe_countries/1
  def destroy
    @stripe_country.destroy
    redirect_to stripe_countries_url, notice: 'Stripe country was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stripe_country
      @stripe_country = StripeCountry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stripe_country_params
      params.require(:stripe_country).permit(:country_name, :country_code)
    end
end
