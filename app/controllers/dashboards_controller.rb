class DashboardsController < ApplicationController
  def new
    @dashboard = Dashboard.new
  end

  def create
    @dashboard = Dashboard.new(params.require(:dashboard).permit(:query, :order, :track_notifications))
    if @dashboard.save
      redirect_to dashboards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if dashboard.update(params.require(:dashboard).permit(:query, :order, :track_notifications))
      redirect_to dashboards_path
    else
      @dashboard = dashboard.merge(params.require(:dashboard).permit(:query, :order, :track_notifications))
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    dashboard.destroy
    redirect_to dashboards_path
  end

  def show
    @page = params[:page]&.to_i || 1
    dashboard
  end

  def edit
    dashboard
  end

  private

  def dashboard
    @dashboard = Dashboard.find(params[:id])
  end
end
