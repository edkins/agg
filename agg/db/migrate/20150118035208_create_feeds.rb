class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :website, index: true
      t.string :feedname
      t.string :feedid

      t.timestamps null: false
    end
    add_foreign_key :feeds, :websites
  end
end
