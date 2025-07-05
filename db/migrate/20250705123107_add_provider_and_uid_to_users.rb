class AddProviderAndUidToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :provider, :integer
    add_column :users, :uid, :integer
    add_index :users, :uid, unique: true
  end
end
