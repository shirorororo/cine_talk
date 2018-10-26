class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.text :word
      t.bigint :user_id
      t.references :user, foreign_key: true
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.timestamps
    end
  end
end
