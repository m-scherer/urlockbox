class RemoveUserFromLinks < ActiveRecord::Migration[5.0]
  def change
    remove_column :links, :user, :integer
  end
end
