class ChangeBets < ActiveRecord::Migration
  def change
    add_column :bets, :evaluated , :boolean, :default => false
  end
end
