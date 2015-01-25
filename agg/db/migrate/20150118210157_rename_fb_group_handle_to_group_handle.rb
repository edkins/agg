class RenameFbGroupHandleToGroupHandle < ActiveRecord::Migration
  def change
    remove_column :fb_groups, :fb_group_handle
    add_column :fb_groups, :group_handle, :string
  end
end
