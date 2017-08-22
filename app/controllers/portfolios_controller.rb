class PortfoliosController < ApplicationController
  def index
    @portfolios_items = Portfolio.all
  end

  def new
    @portfolios_item = Portfolio.new
  end

  def create
    @portfolios_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolios_item.save
        format.html { redirect_to portfolios_path, notice: "Your Profile Item added" }
      else
        format.html { render :new }
      end
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
