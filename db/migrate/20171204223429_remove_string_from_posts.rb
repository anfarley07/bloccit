class RemoveStringFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :string 
  end
end
