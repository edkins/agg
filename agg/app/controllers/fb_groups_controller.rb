require 'open-uri'
require 'json'

class FbGroupsController < ApplicationController
  def index
    @fb_groups = FbGroup.all
  end

  def show
    @fb_group = FbGroup.where(group_handle: params[:id]).first
  end

  def create
    @fb_group = FbGroup.new(params.require(:fb_group).permit(:fb_node_id, :fb_group_handle, :name))
    @fb_group.save
    redirect_to fb_groups_path
  end

  def update
    @fb_group = FbGroup.find(params[:id])
    @fb_group.update_from_facebook(params[:fb_access_token])
    redirect_to fb_group_path(id: @fb_group.group_handle)
  end

  def destroy
    @fb_group = FbGroup.find(params[:id])
    @fb_group.destroy
    redirect_to fb_groups_path
  end
end
