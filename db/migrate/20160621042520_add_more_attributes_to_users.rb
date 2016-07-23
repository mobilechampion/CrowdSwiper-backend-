class AddMoreAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_submit_articles, :integer, default: 0
    add_column :users, :total_homepage_articles, :integer, default: 0
    add_column :users, :total_removed_articles, :integer, default: 0
    add_column :users, :total_sent_invitations, :integer, default: 0
    add_column :users, :total_register_invitations, :integer, default: 0
    add_column :users, :total_days_as_member, :integer, default: 0
  end
end
