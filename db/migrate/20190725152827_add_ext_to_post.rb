class AddExtToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :ext, :string
  end
end
