class BulletinsController < ApplicationController
  def index
    @bulletins = Bulletin.all
  end

  def create
    @bulletin = Bulletin.new(params.require(:bulletin).permit(:text))
    @bulletin.save
    redirect_to bulletins_path
  end

  def destroy
    @bulletin = Bulletin.find(params[:id])
    @bulletin.destroy
    redirect_to bulletins_path
  end
end
