class CreateFollows < ActiveRecord::Migration[8.0]
  def change
    create_table :follows, primary_key: [:follower_id, :following_id] do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.references :following, null: false, foreign_key: { to_table: :users }
      t.integer :status

      t.timestamps
    end
  end
end
