class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :profile, :text
    add_column :users, :profile_image, :text
  end
end
