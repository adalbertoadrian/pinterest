class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :img_name
      t.integer :user_id

      t.timestamps
    end
  end
end
