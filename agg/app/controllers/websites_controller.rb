class WebsitesController < ApplicationController
  def index
    @websites = Website.all
  end

  def show
    @website = Website.find(params[:id])
  end

  def create
    @website = Website.new(params.require(:website).permit(:websiteid, :name, :url))
    @website.save
    redirect_to websites_path
  end

  def destroy
    @website = Website.find(params[:id])
    @website.destroy
    redirect_to websites_path
  end
end
