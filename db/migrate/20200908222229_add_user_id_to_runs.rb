class AddUserIdToRuns < ActiveRecord::Migration[6.0]
  def change
    add_column :runs, :user_id, :integer
    add_foreign_key :runs, :users
  end
end
