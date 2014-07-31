class ChangeBets < ActiveRecord::Migration
  def change
    remove_column :bets, :evaluated
    add_column :bets, :evaluated , :boolean, :default => false
  end
end
