class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
       t.string :title
       t.text :review
       t.text :review_image
       t.references :user, foreign_key: true
       t.datetime "created_at", null: false
       t.datetime "updated_at", null: false
       t.timestamps
    end
  end
end
