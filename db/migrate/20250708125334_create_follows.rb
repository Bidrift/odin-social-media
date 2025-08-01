class CreateFollows < ActiveRecord::Migration[8.0]
  def change
    create_table :follows do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.references :following, null: false, foreign_key: { to_table: :users }
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :follows, [ :follower_id, :following_id ], unique: true
  end
end
