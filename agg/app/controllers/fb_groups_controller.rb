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
    fb_access_token = params[:fb_access_token]
    fb_group_id = @fb_group.fb_node_id
    open("https://graph.facebook.com/#{fb_group_id}/feed?access_token=#{fb_access_token}") { |f|
      json = f.read
      obj = JSON.parse(json)
      obj["data"].each {|thread|}
      thread = obj["data"][0]
        fb_thread_id = thread["id"]
        fb_user_id = thread["from"]["id"]
        text = thread["message"]
        date = thread["created_time"]
        @fb_group.fb_threads.create(
          fb_node_id: fb_thread_id,
          fb_user_id: fb_user_id,
          text: text,
          date: date
          );
    }
    redirect_to fb_group_path(@fb_group)
  end

  def destroy
    @fb_group = FbGroup.find(params[:id])
    @fb_group.destroy
    redirect_to fb_groups_path
  end
end
