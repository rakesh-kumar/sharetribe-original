class Admin::HomepagesController < ApplicationController
  include CommunitiesHelper

  before_filter :ensure_is_admin

  def index
    @selected_left_navi_link = "homepages"
    @community = @current_community
    @homepage = Homepage.last.present? ? Homepage.last : Homepage.new
  end

  def create
    @homepage = Homepage.new(homepage_params)
    if @homepage.save
      redirect_to :back, notice: 'Successfully updated'
    else
      render :index
    end
  end

  def update
    @homepage = Homepage.find(params[:id])
    if @homepage.update(homepage_params)
      redirect_to :back, notice: 'Successfully updated'
    else
      render :index
    end
  end

  private
    def homepage_params
      params.require(:homepage).permit!
    end
end
