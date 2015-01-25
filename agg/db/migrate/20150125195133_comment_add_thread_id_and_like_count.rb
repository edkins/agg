class CommentAddThreadIdAndLikeCount < ActiveRecord::Migration
  def change
    add_reference :fb_comments, :fb_threads, index:true
    add_column :fb_comments, :like_count, :integer
  end
end
