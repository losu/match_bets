class ChangeGroup < ActiveRecord::Migration
  def change
  	add_column :groups, :owner, :integer
  end
end
