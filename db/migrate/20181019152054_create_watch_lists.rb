class CreateWatchLists < ActiveRecord::Migration[5.1]
  def change
    create_table :watch_lists do |t|
      t.references :user, foreign_key: true
      t.text :watch_list
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.timestamps
    end
  end
end
