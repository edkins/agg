class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :article, index: true
      t.date :date
      t.string :username
      t.text :text

      t.timestamps null: false
    end
    add_foreign_key :comments, :articles
  end
end
