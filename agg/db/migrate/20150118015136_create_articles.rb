class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :username
      t.references :website, index: true
      t.date :date
      t.text :headline

      t.timestamps null: false
    end
    add_foreign_key :articles, :websites
  end
end
