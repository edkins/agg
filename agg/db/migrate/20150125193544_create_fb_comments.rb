class CreateFbComments < ActiveRecord::Migration
  def change
    create_table :fb_comments do |t|
      t.string :fb_nodeid
      t.references :fb_user, index: true
      t.text :text
      t.datetime :date

      t.timestamps null: false
    end
    add_foreign_key :fb_comments, :fb_users
  end
end
