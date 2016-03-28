class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :category_id
      t.string :name

      t.timestamps null: false
    end
  end
end
