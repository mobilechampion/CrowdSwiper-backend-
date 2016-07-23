class AddColumsToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :political_persuasion, :integer
  end
end
