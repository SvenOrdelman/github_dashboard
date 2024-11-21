class QuickLinksController < ApplicationController
  def index
    @quick_links = QuickLink.all
  end

  def create
    @quick_link = QuickLink.new(quick_link_params)

    if @quick_link.save
      redirect_to quick_links_path
    else
      redirect_to quick_links_path, notice: 'could not save quick link'
    end
  end

  def destroy
    @quick_link = QuickLink.find(params[:id])
    @quick_link.destroy
    redirect_to quick_links_path
  end

  private

  def quick_link_params
    params.require(:quick_link).permit(:name, :url)
  end
end

