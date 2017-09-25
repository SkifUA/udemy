class PortfoliosController < ApplicationController
  before_action :set_portfolios_item, only: [:edit, :show, :update, :destroy]

  layout 'portfolio'

  access all: [:show, :index, :angular],
         user: {except: [:destroy, :new, :create, :update, :edit, :sort]},
         site_admin: :all

  def index
    @portfolios_items = Portfolio.by_position
  end

  def angular
    @angular_portfolios_items = Portfolio.angular_items
  end

  def new
    @portfolios_item = Portfolio.new
  end

  def create
    @portfolios_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolios_item.save
        format.html { redirect_to portfolios_path, notice: I18n.t('portfolio.create') }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolios_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: I18n.t('portfolio.update') }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @portfolios_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: I18n.t('portfolio.destroy') }
    end
  end

  def sort
    params[:order].each do |_key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
  end

  private
  def portfolio_params
    params
        .require(:portfolio)
        .permit(
            :title,
            :subtitle,
            :body,
            :main_image,
            :thumb_image,
            technologies_attributes: [:id, :name, :_destroy]
        )
  end

  def set_portfolios_item
    @portfolios_item = Portfolio.find(params[:id])
  end
end
