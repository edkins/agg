class FbThreadsController < ApplicationController
  def destroy
    @fb_thread = FbThread.find(params[:id])
    @fb_thread.destroy
    redirect_to fb_group_path(id: @fb_thread.fb_group.group_handle)
  end
end
