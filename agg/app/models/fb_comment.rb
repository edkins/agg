class FbComment < ActiveRecord::Base
  belongs_to :fb_user
  belongs_to :fb_thread

  def self.update_from_obj(obj, fb_thread_id)
    fb_nodeid = obj["id"]
    fb_user_id = FbUser.update_from_obj(obj["from"])
    text = obj["message"]
    date = obj["created_time"]
    like_count = obj["like_count"]
    par = {fb_nodeid: fb_nodeid, fb_user_id: fb_user_id, text: text, date:date, fb_thread_id:fb_thread_id, like_count:like_count} 
    update_record(par)
  end

  def self.update_record(par)
    comment = FbComment.find_by(fb_nodeid: par[:fb_nodeid])
    if comment == nil then
      comment = FbComment.create(par)
    else
      comment.update(par)
    end
    return comment.id
  end

  def user_name
    if self.fb_user == nil then
      return '???'
    else
      return self.fb_user.name
    end
  end
end
