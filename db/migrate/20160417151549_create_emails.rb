class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :title
      t.text :body
      t.date :week_of

      t.timestamps null: false
    end
  end
end
