class FbGroup < ActiveRecord::Base
  has_many :fb_threads, inverse_of: :fb_group

  def update_from_facebook(fb_access_token)
    open("https://graph.facebook.com/#{self.fb_node_id}/feed?access_token=#{fb_access_token}") { |f|
      json = f.read
      obj = JSON.parse(json)
      obj["data"].each {|thread|
        FbThread.update_from_obj(thread, self.id)
      }
    }
  end
end
