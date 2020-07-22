class AddUserIdToCommercials < ActiveRecord::Migration[6.0]
  def change
    add_column :commercials, :user_id, :integer
  end
end
