class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes, primary_key: [ :liker_id, :liked_post_id ] do |t|
      t.references :liker, null: false, foreign_key: { to_table: :users }
      t.references :liked_post, null: false, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
