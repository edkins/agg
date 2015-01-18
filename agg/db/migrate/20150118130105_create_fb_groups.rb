class CreateFbGroups < ActiveRecord::Migration
  def change
    create_table :fb_groups do |t|
      t.text :fb_node_id
      t.text :fb_group_handle
      t.string :name

      t.timestamps null: false
    end
  end
end
