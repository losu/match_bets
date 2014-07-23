class ChangeUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :nickname, :string
  end
end
