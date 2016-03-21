class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :description
      t.string :type_of_post

      t.timestamps null: false
    end
  end
end
