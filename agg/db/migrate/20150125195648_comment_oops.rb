class CommentOops < ActiveRecord::Migration
  def change
    remove_column :fb_comments, :fb_threads
    add_reference :fb_comments, :fb_thread, index:true
  end
end
