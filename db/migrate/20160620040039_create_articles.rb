class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
