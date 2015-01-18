class CreateFbThreads < ActiveRecord::Migration
  def change
    create_table :fb_threads do |t|
      t.string :fb_node_id
      t.string :fb_user_id
      t.text :text
      t.date :date
      t.integer :like_count
      t.references :fb_group, index: true

      t.timestamps null: false
    end
    add_foreign_key :fb_threads, :fb_groups
  end
end
