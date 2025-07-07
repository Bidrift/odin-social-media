class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles, id: false, primary_key: :user_id do |t|
      t.references :user, null: false, foreign_key: true
      t.string :avatar_url, default: "profile.jpg"
      t.string :bio

      t.timestamps
    end
  end
end
