class ChangeInvite < ActiveRecord::Migration
  def change
  	add_column :invites, :group_id, :integer
  end
end
