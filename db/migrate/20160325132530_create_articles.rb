class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :type_of_article
      t.string :user_id

      t.timestamps null: false
    end
    add_index :articles, :user_id
  end
end
