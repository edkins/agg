class UserShouldBeReference < ActiveRecord::Migration
  def change
    remove_column :fb_threads, :fb_user_id
    add_reference :fb_threads, :fb_user, index:true
  end
end
