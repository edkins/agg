class FbThread < ActiveRecord::Base
  belongs_to :fb_group, inverse_of: :fb_threads
  belongs_to :fb_user
  has_many :fb_comments

  def self.update_from_obj(obj, fb_group_id)
    fb_node_id = obj["id"]
    fb_user_id = FbUser.update_from_obj(obj["from"])
    text = obj["message"]
    date = obj["created_time"]
    par = {fb_node_id: fb_node_id, fb_user_id: fb_user_id, text: text, date:date, fb_group_id:fb_group_id} 
    thread = update_record(par)
    comments = obj["comments"]
    if comments != nil then
      comments["data"].each {|comment|
        FbComment.update_from_obj(comment, thread.id)
      }
    end
  end

  def self.update_record(par)
    thread = FbThread.find_by(fb_node_id: par[:fb_node_id])
    if thread == nil then
      thread = FbThread.create(par)
    else
      thread.update(par)
    end
    return thread
  end

  def user_name
    if self.fb_user == nil then
      return '???'
    else
      return self.fb_user.name
    end
  end
end
