class RemoveMatchesIdFromGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :matches_idmatches 
  end
end
