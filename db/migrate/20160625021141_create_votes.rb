class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.float :value
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
