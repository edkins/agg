class CreateUsernames < ActiveRecord::Migration
  def change
    create_table :usernames do |t|
      t.references :person, index: true
      t.references :website, index: true
      t.string :username

      t.timestamps null: false
    end
    add_foreign_key :usernames, :people
    add_foreign_key :usernames, :websites
  end
end
