class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.string :body
      t.references :commenter, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
