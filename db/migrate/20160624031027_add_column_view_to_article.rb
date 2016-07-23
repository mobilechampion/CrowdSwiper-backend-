class AddColumnViewToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :total_view, :integer, default: 0
    add_column :articles, :score, :integer, default: 5
  end
end
