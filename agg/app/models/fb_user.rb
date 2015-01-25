class FbUser < ActiveRecord::Base
  belongs_to :person

  def self.update_from_obj(obj)
    fb_node_id = obj['id']
    name = obj['name']
    user = FbUser.find_by(fb_node_id: fb_node_id)
    par = {fb_node_id: fb_node_id, name: name}
    if user == nil then
      user = FbUser.create(par)
    else
      user.update(par)
    end
    return user.id
  end
end
