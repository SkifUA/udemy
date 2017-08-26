class PortfoliosController < ApplicationController
  layout 'portfolio'
  def index
    @portfolios_items = Portfolio.all
  end

  def angular
    @angular_portfolios_items = Portfolio.angular_items
  end

  def new
    @portfolios_item = Portfolio.new
    3.times { @portfolios_item.technologies.build }
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

  def edit
    @portfolios_item = Portfolio.find(params[:id])
  end

  def update
    @portfolios_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolios_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolios_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolios_item = Portfolio.find(params[:id])

    @portfolios_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio Items removed' }
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
            technologies_attributes: [:name]
        )
  end
end
