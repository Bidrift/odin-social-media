class AddDefaultToProfileBio < ActiveRecord::Migration[8.0]
  def change
    change_column_default :profiles, :bio, "This is my personal page!"
  end
end
