class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.date :date
      t.text :text

      t.timestamps null: false
    end
  end
end
