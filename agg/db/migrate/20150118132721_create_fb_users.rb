class CreateFbUsers < ActiveRecord::Migration
  def change
    create_table :fb_users do |t|
      t.string :fb_node_id
      t.string :name
      t.references :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :fb_users, :people
  end
end
